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
  late final TextEditingController _phoneController;
  late final TextEditingController _departmentController;
  late final TextEditingController _positionController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _departmentController = TextEditingController();
    _positionController = TextEditingController();

    _nameController.addListener(_onChanged);
    _emailController.addListener(_onChanged);
    _phoneController.addListener(_onChanged);
    _departmentController.addListener(_onChanged);
    _positionController.addListener(_onChanged);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    _positionController.dispose();
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
          onPressed: () => context.router.pop(),
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
              const RegisterHeadlineWidget(),
              NameFormWidget(nameController: _nameController),
              EmailFormWidget(emailController: _emailController),
              PhoneFormWidget(phoneController: _phoneController),
              DepartmentFormWidget(departmentController: _departmentController),
              PositionFormWidget(positionController: _positionController),
              ContinueButtonWidget(
                formKey: _formKey,
                nameController: _nameController,
                emailController: _emailController,
                phoneController: _phoneController,
                departmentController: _departmentController,
                positionController: _positionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
