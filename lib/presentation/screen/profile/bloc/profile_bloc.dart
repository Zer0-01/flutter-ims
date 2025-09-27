import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/me_dto_response.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppLogger _logger = AppLogger.getLogger("ProfileBloc");
  late final AuthRepository _authRepository;

  ProfileBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const ProfileState()) {
    on<OnInitProfileEvent>(_onInitProfileEvent);
  }

  Future<void> _onInitProfileEvent(
    OnInitProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    _logger.debug("onInitProfile");
    await _getMe(emit);
  }

  Future<void> _getMe(Emitter<ProfileState> emit) async {
    _logger.debug("getMe");
    try {
      emit(state.copyWith(getMeStatus: GetMeStatus.loading));

      final MeDtoResponse meDtoResponse = await _authRepository.getMe();
      final String userName = meDtoResponse.data.name;
      final String userEmail = meDtoResponse.data.email;
      final bool isVerified = meDtoResponse.data.emailVerified;

      _logger.debug("userName: $userName");
      _logger.debug("userEmail: $userEmail");
      _logger.debug("isVerified: $isVerified");

      emit(
        state.copyWith(
          getMeStatus: GetMeStatus.success,
          userName: userName,
          userEmail: userEmail,
          isVerified: isVerified,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      _logger.error("DioExceptionType: ${e.type}");

      emit(
        state.copyWith(
          getMeStatus: GetMeStatus.failure,
          dioTypeGetMe: e.type,
          dioCodeGetMe: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("Error: $e");
      emit(
        state.copyWith(
          getMeStatus: GetMeStatus.failure,
          dioTypeGetMe: DioExceptionType.unknown,
          dioCodeGetMe: 0,
        ),
      );
    }
  }
}
