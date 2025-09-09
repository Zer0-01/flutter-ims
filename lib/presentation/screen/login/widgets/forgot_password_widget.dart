import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        context.l10n.forgot_your_password,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
        ),
      ),
    );
  }
}
