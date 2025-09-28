import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class ProductBasicInfoWidget extends StatelessWidget {
  const ProductBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
              context.l10n.basic_info,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppTextFormFieldWidget(label: Text(context.l10n.name)),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFieldWidget(
                    label: Text("${context.l10n.sku}/${context.l10n.barcode}"),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.barcode_reader),
                ),
              ],
            ),
            AppTextFormFieldWidget(
              label: Text(context.l10n.categories),
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
      ),
    );
  }
}
