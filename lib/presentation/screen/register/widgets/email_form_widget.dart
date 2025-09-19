import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

class EmailFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  const EmailFormWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: emailController,
        validator: (value) {
          if (FormValidator.isNotValidEmail(value ?? "")) {
            return context.l10n.email_must_be_valid;
          }
          return null;
        },
        label: Text(context.l10n.email),
        hintText: context.l10n.eg_johndoemailcom,
      ),
    );
  }
}
