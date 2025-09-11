import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/user_repository.dart';
import 'package:flutter_ims/presentation/screen/register/bloc/register_bloc.dart';
import 'package:flutter_ims/presentation/screen/register/register_screen.dart';

@RoutePage()
class RegisterSetupScreen extends StatelessWidget {
  const RegisterSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(userRepository: UserRepository()),
      child: const RegisterScreen(),
    );
  }
}
