import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/email_form_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/password_form_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 8,
            children: [
              EmailFormWidget(emailController: emailController),

              PasswordFormWidget(passwordController: passwordController),
            ],
          ),
        );
      },
    );
  }
}
