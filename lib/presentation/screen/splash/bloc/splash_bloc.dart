import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppLogger _logger = AppLogger.getLogger("SplashBloc");
  late final AppSecureStorage _appSecureStorage;

  SplashBloc({required AppSecureStorage appSecureStorage})
    : _appSecureStorage = appSecureStorage,
      super(const SplashState()) {
    on<OnInitSplashEvent>(_onInitSplashEvent);
  }

  Future<void> _onInitSplashEvent(
    OnInitSplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    _logger.debug("onInitSplash");

    await Future.delayed(const Duration(seconds: 2));
    await _getAccessToken(emit);
  }

  Future<void> _getAccessToken(Emitter<SplashState> emit) async {
    _logger.debug("getAccessToken");

    try {
      emit(state.copyWith(getAccessTokenStatus: GetAccessTokenStatus.loading));

      final String? accessToken = await _appSecureStorage.read(
        SecureStorageKeys.accessToken.name,
      );

      final bool isLogin = accessToken != null && accessToken.isNotEmpty;

      _logger.debug("accessToken: $accessToken");
      _logger.debug("isLogin: $isLogin");

      emit(
        state.copyWith(
          getAccessTokenStatus: GetAccessTokenStatus.success,
          isLogin: isLogin,
        ),
      );
    } catch (e) {
      _logger.error("getAccessToken error: $e");
      emit(state.copyWith(getAccessTokenStatus: GetAccessTokenStatus.failure));
    }
  }
}
