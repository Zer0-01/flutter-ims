import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class OrganizationNameFormWidget extends StatelessWidget {
  final TextEditingController organizationNameController;
  const OrganizationNameFormWidget({
    super.key,
    required this.organizationNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        controller: organizationNameController,
        label: Text(context.l10n.name),
        hintText: context.l10n.eg_ABC_sdn_bhd,
      ),
    );
  }
}
