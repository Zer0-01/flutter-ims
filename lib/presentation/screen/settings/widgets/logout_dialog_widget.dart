import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Text(
              "${context.l10n.logout}?",
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(context.l10n.are_you_sure_you_want_to_log_out_of_your_account),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: context.colorScheme.primary),
                    ),

                    child: Text(context.l10n.cancel),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(context.l10n.logout),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
