import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class PhoneFormWidget extends StatelessWidget {
  const PhoneFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppTextFormFieldWidget(
        label: Text(context.l10n.phone_number),
        hintText: context.l10n.eg_60123456789,
      ),
    );
  }
}
