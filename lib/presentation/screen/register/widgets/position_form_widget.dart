import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class PositionFormWidget extends StatelessWidget {
  final TextEditingController positionController;
  const PositionFormWidget({super.key, required this.positionController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: positionController,
        label: Text("${context.l10n.position} (${context.l10n.optional})"),
        hintText: context.l10n.eg_software_engineer,
      ),
    );
  }
}
