part of 'password_bloc.dart';

sealed class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class OnPressedRegisterEvent extends PasswordEvent {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final String userPassword;
  final String organizationName;
  final String organizationEmail;

  const OnPressedRegisterEvent({
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.userPassword,
    required this.organizationName,
    required this.organizationEmail,
  });

  @override
  List<Object> get props => [
    userName,
    userEmail,
    userPhone,
    userDepartment,
    userPosition,
    userPassword,
    organizationName,
    organizationEmail,
  ];
}
