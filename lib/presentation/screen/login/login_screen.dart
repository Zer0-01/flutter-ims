import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/forgot_password_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_button_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_form_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/login_headline_widget.dart';
import 'package:flutter_ims/presentation/screen/login/widgets/sign_up_widget.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                LoginHeadlineWidget(),
                SignUpWidget(),
                LoginFormWidget(),
                ForgotPasswordWidget(),
                LoginButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
