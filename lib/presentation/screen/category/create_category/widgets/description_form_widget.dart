import 'package:flutter/widgets.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class DescriptionFormWidget extends StatelessWidget {
  final TextEditingController descriptionController;

  const DescriptionFormWidget({super.key, required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      controller: descriptionController,
      label: Text(context.l10n.description),
    );
  }
}
