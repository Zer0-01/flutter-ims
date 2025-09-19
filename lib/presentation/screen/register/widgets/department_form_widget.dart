import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class DepartmentFormWidget extends StatelessWidget {
  const DepartmentFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      label: context.l10n.department,
      hintText: context.l10n.eg_johndoemailcom,
    );
  }
}
