part of 'settings_bloc.dart';

enum PostLogoutStatus { initial, loading, success, failure }

class SettingsState extends Equatable {
  final PostLogoutStatus postLogoutStatus;

  const SettingsState({this.postLogoutStatus = PostLogoutStatus.initial});

  SettingsState copyWith({PostLogoutStatus? postLogoutStatus}) {
    return SettingsState(
      postLogoutStatus: postLogoutStatus ?? this.postLogoutStatus,
    );
  }

  @override
  List<Object> get props => [postLogoutStatus];
}
