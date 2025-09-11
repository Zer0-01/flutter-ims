import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/request/register_dto_request.dart';
import 'package:flutter_ims/data/models/response/register_dto_response.dart';
import 'package:flutter_ims/data/repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AppLogger _logger = AppLogger.getLogger("RegisterBloc");
  late final UserRepository _userRepository;

  RegisterBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const RegisterState()) {
    on<OnPressedRegisterEvent>(_onPressedRegister);
    on<OnPressedObscurePasswordEvent>(_onPressedObscurePassword);
    on<OnPressedObscureConfirmPasswordEvent>(_onPressedObscureConfirmPassword);
  }

  //PRIVATE EVENTS//
  Future<void> _onPressedRegister(
    OnPressedRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    _logger.debug("onPressedRegister");
    final String name = event.name;
    final String email = event.email;
    final String password = event.password;

    _logger.debug("name: $name");
    _logger.debug("email: $email");
    _logger.debug("password: $password");

    final RegisterDtoRequest registerDtoRequest = RegisterDtoRequest(
      name: name,
      email: email,
      password: password,
    );

    await _postRegister(emit, registerDtoRequest: registerDtoRequest);
  }

  void _onPressedObscurePassword(
    OnPressedObscurePasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    _logger.debug("onPressedObscurePassword");
    _logger.debug("isObscurePassword: ${event.isObscurePassword}");
    emit(state.copyWith(isObscurePassword: !event.isObscurePassword));
  }

  void _onPressedObscureConfirmPassword(
    OnPressedObscureConfirmPasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    _logger.debug("onPressedObscureConfirmPassword");
    _logger.debug(
      "isObscureConfirmPassword: ${event.isObscureConfirmPassword}",
    );
    emit(
      state.copyWith(isObscureConfirmPassword: !event.isObscureConfirmPassword),
    );
  }

  //PRIVATE METHODS//
  Future<void> _postRegister(
    Emitter<RegisterState> emit, {
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    _logger.debug("postRegister");
    try {
      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.loading));

      final RegisterDtoResponse registerDtoResponse = await _userRepository
          .postRegister(registerDtoRequest: registerDtoRequest);

      final String accessToken = registerDtoResponse.data.accessToken;
      final String refreshToken = registerDtoResponse.data.refreshToken;

      _logger.debug("accessToken: $accessToken");
      _logger.debug("refreshToken: $refreshToken");

      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.success));
    } on DioException catch (e) {
      _logger.error("postRegister error: {}", [e.message]);
      _logger.error("type: {}", [e.type]);
      _logger.error("code: {}", [e.response?.statusCode]);

      emit(
        state.copyWith(
          postRegisterStatus: PostRegisterStatus.failure,
          dioTypePostRegister: e.type,
          dioCodePostRegister: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("postRegister error: {}", [e.toString()]);
      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.failure));
    }
  }
}
