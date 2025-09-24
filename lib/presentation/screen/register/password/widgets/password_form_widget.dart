import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: widget.passwordController,
        label: Text(context.l10n.password),
        suffixIcon: GestureDetector(
          onTap: () => setState(() => isObscure = !isObscure),
          child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ),
        obscureText: isObscure,
        validator: (value) {
          if (FormValidator.isNotContainEightCharacters(
            widget.passwordController.text,
          )) {
            return context.l10n.password_must_be_at_least_8_characters;
          }

          if (FormValidator.isNotAlphaNumeric(widget.passwordController.text)) {
            return context.l10n.password_must_be_alpha_numeric;
          }

          if (FormValidator.isNotContainSpecialCharacter(
            widget.passwordController.text,
          )) {
            return context.l10n.password_must_contain_special_character;
          }

          if (FormValidator.isNotMixedCase(widget.passwordController.text)) {
            return context.l10n.password_must_be_mixed_case;
          }

          return null;
        },
      ),
    );
  }
}
