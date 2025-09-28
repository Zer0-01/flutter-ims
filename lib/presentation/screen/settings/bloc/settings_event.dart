part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class OnPressedLogoutEvent extends SettingsEvent {
  const OnPressedLogoutEvent();

  @override
  List<Object> get props => [];
}
