import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

class ConfirmPasswordFormWidget extends StatefulWidget {
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  const ConfirmPasswordFormWidget({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
  });

  @override
  State<ConfirmPasswordFormWidget> createState() =>
      _ConfirmPasswordFormWidgetState();
}

class _ConfirmPasswordFormWidgetState extends State<ConfirmPasswordFormWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: widget.confirmPasswordController,
        label: Text(context.l10n.confirm_password),
        suffixIcon: GestureDetector(
          onTap: () => setState(() => isObscure = !isObscure),
          child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ),
        obscureText: isObscure,
        validator: (value) {
          if (FormValidator.isPasswordNotMatch(
            widget.passwordController.text,
            widget.confirmPasswordController.text,
          )) {
            return context.l10n.passwords_do_not_match;
          }
          return null;
        },
      ),
    );
  }
}
