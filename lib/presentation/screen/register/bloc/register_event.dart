part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class OnPressedRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  const OnPressedRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class OnPressedObscurePasswordEvent extends RegisterEvent {
  final bool isObscurePassword;

  const OnPressedObscurePasswordEvent({required this.isObscurePassword});

  @override
  List<Object> get props => [isObscurePassword];
}

class OnPressedObscureConfirmPasswordEvent extends RegisterEvent {
  final bool isObscureConfirmPassword;

  const OnPressedObscureConfirmPasswordEvent({
    required this.isObscureConfirmPassword,
  });

  @override
  List<Object> get props => [isObscureConfirmPassword];
}
