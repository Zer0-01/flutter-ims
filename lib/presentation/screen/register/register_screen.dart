import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/login_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_button_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_headline_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RegisterHeadlineWidget(),
                const LoginWidget(),
                RegisterFormWidget(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                const RegisterButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
