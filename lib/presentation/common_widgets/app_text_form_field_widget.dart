import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final Widget? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AppTextFormFieldWidget({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.colorScheme.error),
        ),
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.outline,
        ),
        label: label,
      ),
    );
  }
}
