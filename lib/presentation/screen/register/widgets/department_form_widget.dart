import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class DepartmentFormWidget extends StatelessWidget {
  final TextEditingController departmentController;
  const DepartmentFormWidget({super.key, required this.departmentController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: departmentController,
        label: Text("${context.l10n.department} (${context.l10n.optional})"),
        hintText: context.l10n.eg_software,
      ),
    );
  }
}
