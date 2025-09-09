import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class LoginHeadlineWidget extends StatelessWidget {
  const LoginHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 32, right: 16),
      child: Text(
        context.l10n.sign_in_to_your_account,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
