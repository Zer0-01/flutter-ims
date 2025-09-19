import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final Widget? label;
  final String? hintText;
  const AppTextFormFieldWidget({super.key, required this.label, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.outline,
        ),
        label: label,
      ),
    );
  }
}
