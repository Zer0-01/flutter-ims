import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/continue_button_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/department_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/email_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/name_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/phone_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/position_form_widget.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: const Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterHeadlineWidget(),
                NameFormWidget(),
                EmailFormWidget(),
                PhoneFormWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    spacing: 16,
                    children: [
                      Expanded(child: DepartmentFormWidget()),
                      Expanded(child: PositionFormWidget()),
                    ],
                  ),
                ),
                ContinueButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
