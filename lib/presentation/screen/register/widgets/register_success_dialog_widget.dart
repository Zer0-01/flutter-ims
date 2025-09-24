import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class RegisterSuccessDialogWidget extends StatelessWidget {
  const RegisterSuccessDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 100),
              Text(
                context.l10n.welcome_aboard,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(context.l10n.you_can_now_log_in_and_start_exploring),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(context.l10n.continue_to_login),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
