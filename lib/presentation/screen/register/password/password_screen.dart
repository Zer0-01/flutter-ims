import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/password/widgets/confirm_password_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/password/widgets/password_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/password/widgets/password_headline_widget.dart';
import 'package:flutter_ims/presentation/screen/register/password/widgets/register_button_widget.dart';

class PasswordScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final String organizationName;
  final String organizationEmail;

  const PasswordScreen({
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
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _passwordController.addListener(_onChanged);
    _confirmPasswordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PasswordHeadlineWidget(),
              PasswordFormWidget(passwordController: _passwordController),
              ConfirmPasswordFormWidget(
                confirmPasswordController: _confirmPasswordController,
              ),

              RegisterButtonWidget(
                passwordController: _passwordController,
                confirmPasswordController: _confirmPasswordController,
                userName: widget.userName,
                userEmail: widget.userEmail,
                userPhone: widget.userPhone,
                userDepartment: widget.userDepartment,
                userPosition: widget.userPosition,
                organizationName: widget.organizationName,
                organizationEmail: widget.organizationEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
