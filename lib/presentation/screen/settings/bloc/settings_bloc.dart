import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_local_storage.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppLogger _logger = AppLogger.getLogger("SettingsBloc");
  late final AppLocalStorage _appLocalStorage;
  late final AppSecureStorage _appSecureStorage;

  SettingsBloc({
    required AppLocalStorage appLocalStorage,
    required AppSecureStorage appSecureStorage,
  }) : _appLocalStorage = appLocalStorage,
       _appSecureStorage = appSecureStorage,
       super(const SettingsState()) {
    on<OnPressedLogoutEvent>(_onPressedLogoutEvent);
  }

  Future<void> _onPressedLogoutEvent(
    OnPressedLogoutEvent event,
    Emitter<SettingsState> emit,
  ) async {
    _logger.debug("onPressedLogout");
    emit(state.copyWith(postLogoutStatus: PostLogoutStatus.loading));
    await _appLocalStorage.clear();
    await _appSecureStorage.clear();

    emit(state.copyWith(postLogoutStatus: PostLogoutStatus.success));
  }
}
