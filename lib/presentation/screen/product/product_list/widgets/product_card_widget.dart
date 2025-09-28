import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class ProductCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String sku;
  final String sellingPrice;
  final String unit;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.description,
    required this.sku,
    required this.sellingPrice,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          name,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: Text(
          "RM $sellingPrice",
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
