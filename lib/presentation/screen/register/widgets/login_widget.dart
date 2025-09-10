import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          context.l10n.already_have_an_account,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () => context.router.pop(),
          child: Text(
            context.l10n.login,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
