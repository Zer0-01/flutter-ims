import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/request/login_dto_request.dart';
import 'package:flutter_ims/data/models/response/login_dto_response.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppLogger _logger = AppLogger.getLogger("login_bloc.dart");
  late final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState()) {
    on<OnPressedLoginEvent>(_onPressedLogin);
  }

  //PRIVATE EVENTS//
  Future<void> _onPressedLogin(
    OnPressedLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    _logger.debug("onPressedLogin");
    final String email = event.email;
    final String password = event.password;

    _logger.debug("email: $email");
    _logger.debug("password: $password");

    final LoginDtoRequest loginDtoRequest = LoginDtoRequest(
      email: email,
      password: password,
    );

    await _postLogin(emit, loginDtoRequest: loginDtoRequest);
  }

  //PRIVATE METHODS//
  Future<void> _postLogin(
    Emitter<LoginState> emit, {
    required LoginDtoRequest loginDtoRequest,
  }) async {
    _logger.debug("postLogin");

    try {
      emit(state.copyWith(postLoginStatus: PostLoginStatus.loading));

      final LoginDtoResponse loginDtoResponse = await _authRepository.postLogin(
        loginDtoRequest: loginDtoRequest,
      );

      final int id = loginDtoResponse.data.user.id;
      final String name = loginDtoResponse.data.user.name;
      final String accessToken = loginDtoResponse.data.accessToken;
      final String refreshToken = loginDtoResponse.data.refreshToken;

      _logger.debug("id: $id");
      _logger.debug("name: $name");
      _logger.debug("accessToken: $accessToken");
      _logger.debug("refreshToken: $refreshToken");

      emit(state.copyWith(postLoginStatus: PostLoginStatus.success));
    } on DioException catch (e) {
      _logger.error("postLogin error: {}", [e.message]);
      _logger.error("type: {}", [e.type]);
      _logger.error("code: {}", [e.response?.statusCode]);

      emit(
        state.copyWith(
          postLoginStatus: PostLoginStatus.failure,
          dioTypePostLogin: e.type,
          dioCodePostLogin: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("postLogin error: {}", [e.toString()]);

      emit(state.copyWith(postLoginStatus: PostLoginStatus.failure));
    }
  }
}
