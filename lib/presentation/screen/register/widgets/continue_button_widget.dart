import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';

class ContinueButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController departmentController;
  final TextEditingController positionController;

  const ContinueButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.departmentController,
    required this.positionController,
    required this.formKey,
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
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                  )
                  ? () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.router.push(
                        OrganizationSetupRoute(
                          userName: nameController.text,
                          userEmail: emailController.text,
                          userPhone: phoneController.text,
                          userDepartment: departmentController.text,
                          userPosition: positionController.text,
                        ),
                      );
                    }
                  }
                  : null,
          child: Text(context.l10n.continue_string),
        ),
      ),
    );
  }

  bool _isEnabled(String name, String email, String phone) {
    return name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty;
  }
}
