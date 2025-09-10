import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/login_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_button_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_headline_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RegisterHeadlineWidget(),
                LoginWidget(),
                RegisterFormWidget(),
                RegisterButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
