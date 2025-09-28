import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class PasswordFormWidget extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordFormWidget({super.key, required this.passwordController});

  @override
  State<PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      controller: widget.passwordController,
      obscureText: isObscure,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
      ),
      label: Text(context.l10n.password),
    );
  }
}
