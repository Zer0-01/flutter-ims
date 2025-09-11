import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/forgot_password_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_form_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_headline_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/sign_up_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LoginHeadlineWidget(),
                const SignUpWidget(),
                LoginFormWidget(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const ForgotPasswordWidget(),
                LoginButtonWidget(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
