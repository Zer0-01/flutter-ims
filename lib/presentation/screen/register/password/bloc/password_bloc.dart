import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/request/register_dto_request.dart';
import 'package:flutter_ims/data/repository/user_repository.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final AppLogger _logger = AppLogger.getLogger("PasswordBloc");
  late final UserRepository _userRepository;

  PasswordBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const PasswordState()) {
    on<OnPressedRegisterEvent>(_onPressedRegister);
  }

  Future<void> _onPressedRegister(
    OnPressedRegisterEvent event,
    Emitter<PasswordState> emit,
  ) async {
    _logger.debug("onPressedRegister");
    final String userName = event.userName;
    final String userEmail = event.userEmail;
    final String userPhone = event.userPhone;
    final String userDepartment = event.userDepartment;
    final String userPosition = event.userPosition;
    final String userPassword = event.userPassword;
    final String organizationName = event.organizationName;
    final String organizationEmail = event.organizationEmail;

    _logger.debug("userName: $userName");
    _logger.debug("userEmail: $userEmail");
    _logger.debug("userPhone: $userPhone");
    _logger.debug("userDepartment: $userDepartment");
    _logger.debug("userPosition: $userPosition");
    _logger.debug("userPassword: $userPassword");
    _logger.debug("organizationName: $organizationName");
    _logger.debug("organizationEmail: $organizationEmail");

    await _postRegister(
      emit,
      userName: userName,
      userEmail: userEmail,
      userPhone: userPhone,
      userDepartment: userDepartment,
      userPosition: userPosition,
      userPassword: userPassword,
      organizationName: organizationName,
      organizationEmail: organizationEmail,
    );
  }

  Future<void> _postRegister(
    Emitter<PasswordState> emit, {
    required String userName,
    required String userEmail,
    required String userPhone,
    required String userDepartment,
    required String userPosition,
    required String userPassword,
    required String organizationName,
    required String organizationEmail,
  }) async {
    _logger.debug("postRegister");

    try {
      emit(state.copyWith(postRegisterStatus: PostRegisterStatus.loading));

      final RegisterDtoRequest registerDtoRequest = RegisterDtoRequest(
        adminUser: RegisterAdminUser(
          name: userName,
          email: userEmail,
          phone: userPhone,
          password: userPassword,
          department: userDepartment,
          position: userPosition,
        ),
        organization: RegisterOrganization(
          name: organizationName,
          email: userEmail,
        ),
      );

      await _userRepository.postRegister(
        registerDtoRequest: registerDtoRequest,
      );

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

      emit(
        state.copyWith(
          postRegisterStatus: PostRegisterStatus.failure,
          dioTypePostRegister: DioExceptionType.unknown,
          dioCodePostRegister: 0,
        ),
      );
    }
  }
}
