import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class NameFormWidget extends StatelessWidget {
  final TextEditingController nameController;

  const NameFormWidget({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      controller: nameController,
      label: Text(context.l10n.name),
    );
  }
}
