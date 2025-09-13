import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';
import 'package:flutter_ims/data/models/request/login_dto_request.dart';
import 'package:flutter_ims/data/models/response/login_dto_response.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppLogger _logger = AppLogger.getLogger("login_bloc.dart");
  final AppSecureStorage _appSecureStorage = AppSecureStorage();
  late final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState()) {
    on<OnPressedLoginEvent>(_onPressedLogin);
    on<OnPressedObscurePasswordEvent>(_onPressedObscurePassword);
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

  void _onPressedObscurePassword(
    OnPressedObscurePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    _logger.debug("onPressedObscurePassword");
    final bool isObscurePassword = event.isObscurePassword;
    _logger.debug("isObscurePassword: $isObscurePassword");

    emit(state.copyWith(isObscurePassword: !isObscurePassword));
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

      final bool isSaveAccessToken = await _appSecureStorage.save(
        SecureStorageKeys.accessToken.name,
        accessToken,
      );
      final bool isSaveRefreshToken = await _appSecureStorage.save(
        SecureStorageKeys.refreshToken.name,
        refreshToken,
      );

      _logger.debug("isSaveAccessToken: $isSaveAccessToken");
      _logger.debug("isSaveRefreshToken: $isSaveRefreshToken");

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
