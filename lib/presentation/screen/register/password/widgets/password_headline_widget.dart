import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class PasswordHeadlineWidget extends StatelessWidget {
  const PasswordHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: Text(
        context.l10n.password_setup,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
