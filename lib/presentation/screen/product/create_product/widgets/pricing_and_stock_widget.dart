import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class PricingAndStockWidget extends StatelessWidget {
  final TextEditingController costPriceController;
  final TextEditingController sellingPriceController;

  const PricingAndStockWidget({
    super.key,
    required this.costPriceController,
    required this.sellingPriceController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
              context.l10n.pricing_and_stock,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppTextFormFieldWidget(
              controller: costPriceController,
              label: Text(context.l10n.cost_price),
            ),
            AppTextFormFieldWidget(
              controller: sellingPriceController,
              label: Text(context.l10n.selling_price),
            ),
          ],
        ),
      ),
    );
  }
}
