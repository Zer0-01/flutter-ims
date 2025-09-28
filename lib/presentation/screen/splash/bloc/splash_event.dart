part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class OnInitSplashEvent extends SplashEvent {
  const OnInitSplashEvent();

  @override
  List<Object> get props => [];
}
