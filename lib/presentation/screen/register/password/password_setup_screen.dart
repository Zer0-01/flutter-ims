import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';
import 'package:flutter_ims/presentation/screen/register/password/bloc/password_bloc.dart';
import 'package:flutter_ims/presentation/screen/register/password/password_screen.dart';

@RoutePage()
class PasswordSetupScreen extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final String organizationName;
  final String organizationEmail;

  const PasswordSetupScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.organizationName,
    required this.organizationEmail,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordBloc(authRepository: AuthRepository()),
      child: PasswordScreen(
        userName: userName,
        userEmail: userEmail,
        userPhone: userPhone,
        userDepartment: userDepartment,
        userPosition: userPosition,
        organizationName: organizationName,
        organizationEmail: organizationEmail,
      ),
    );
  }
}
