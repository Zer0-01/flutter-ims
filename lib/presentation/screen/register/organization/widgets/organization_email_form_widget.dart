import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

class OrganizationEmailFormWidget extends StatelessWidget {
  final TextEditingController organizationEmailController;

  const OrganizationEmailFormWidget({
    super.key,
    required this.organizationEmailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: organizationEmailController,
        label: Text(context.l10n.email),
        hintText: context.l10n.eg_johndoemailcom,
        validator: (value) {
          if (FormValidator.isNotValidEmail(value ?? "")) {
            return context.l10n.email_must_be_valid;
          }
          return null;
        },
      ),
    );
  }
}
