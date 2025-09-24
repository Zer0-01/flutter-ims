import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class ConfirmPasswordFormWidget extends StatelessWidget {
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordFormWidget({
    super.key,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: confirmPasswordController,
        label: Text(context.l10n.confirm_password),
      ),
    );
  }
}
