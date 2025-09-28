part of 'splash_bloc.dart';

enum GetAccessTokenStatus { initial, loading, success, failure }

class SplashState extends Equatable {
  final GetAccessTokenStatus getAccessTokenStatus;
  final bool isLogin;

  const SplashState({
    this.getAccessTokenStatus = GetAccessTokenStatus.initial,
    this.isLogin = false,
  });

  SplashState copyWith({
    GetAccessTokenStatus? getAccessTokenStatus,
    bool? isLogin,
  }) {
    return SplashState(
      getAccessTokenStatus: getAccessTokenStatus ?? this.getAccessTokenStatus,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object> get props => [getAccessTokenStatus, isLogin];
}
