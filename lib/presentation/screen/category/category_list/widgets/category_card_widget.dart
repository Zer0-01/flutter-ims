import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class CategoryCardWidget extends StatelessWidget {
  final String name;
  final String description;

  const CategoryCardWidget({
    super.key,
    required this.name,
    required this.description,
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
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(description.isNotEmpty ? description : "-"),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
