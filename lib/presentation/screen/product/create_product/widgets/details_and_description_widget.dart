import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class DetailsAndDescriptionWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController unitController;

  const DetailsAndDescriptionWidget({
    super.key,
    required this.descriptionController,
    required this.unitController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 8.0,
        top: 4.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              context.l10n.details_and_description,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppTextFormFieldWidget(
              controller: descriptionController,
              label: Text(context.l10n.description),
            ),
            AppTextFormFieldWidget(
              controller: unitController,
              label: Text(context.l10n.unit),
            ),
          ],
        ),
      ),
    );
  }
}
