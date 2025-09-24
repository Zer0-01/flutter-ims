import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';

class RegisterButtonWidget extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final TextEditingController organizationNameController;
  final TextEditingController organizationEmailController;

  const RegisterButtonWidget({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.organizationNameController,
    required this.organizationEmailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed:
              _isEnabled(
                    organizationName: organizationNameController.text,
                    organizationEmail: organizationEmailController.text,
                  )
                  ? () {
                    context.router.push(
                      PasswordSetupRoute(
                        userName: userName,
                        userEmail: userEmail,
                        userPhone: userPhone,
                        userDepartment: userDepartment,
                        userPosition: userPosition,
                        organizationName: organizationNameController.text,
                        organizationEmail: organizationEmailController.text,
                      ),
                    );
                  }
                  : null,
          child: Text(context.l10n.continue_string),
        ),
      ),
    );
  }

  bool _isEnabled({
    required String organizationName,
    required String organizationEmail,
  }) {
    return organizationName.isNotEmpty && organizationEmail.isNotEmpty;
  }
}
