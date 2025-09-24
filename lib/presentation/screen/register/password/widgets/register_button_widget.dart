import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_ims/presentation/screen/register/password/bloc/password_bloc.dart';
import 'package:flutter_ims/presentation/screen/register/widgets/register_success_dialog_widget.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:toastification/toastification.dart';

class RegisterButtonWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final String organizationName;
  final String organizationEmail;
  final GlobalKey<FormState> formKey;

  const RegisterButtonWidget({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.organizationName,
    required this.organizationEmail,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordBloc, PasswordState>(
      listenWhen:
          (previous, current) =>
              previous.postRegisterStatus != current.postRegisterStatus,
      listener: (context, state) async {
        if (state.postRegisterStatus == PostRegisterStatus.loading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const AppLoadingDialogWidget(),
          );
          return;
        }

        if (state.postRegisterStatus == PostRegisterStatus.failure) {
          Navigator.pop(context);
          toastification.show(
            context: context,
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            title: Text(context.l10n.registration_failed),
            description: Text(
              context.l10n.please_check_your_details_and_try_again,
            ),
            alignment: Alignment.bottomCenter,
            autoCloseDuration: const Duration(seconds: 2),
            closeButton: const ToastCloseButton(
              showType: CloseButtonShowType.none,
            ),
            closeOnClick: false,
            dragToClose: true,
            pauseOnHover: false,
          );
          return;
        }

        if (state.postRegisterStatus == PostRegisterStatus.success) {
          Navigator.pop(context);
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const RegisterSuccessDialogWidget();
            },
          );
          if (!context.mounted) return;
          context.router.popUntil(
            (route) => route.settings.name == LoginSetupRoute.name,
          );
          return;
        }
      },
      child: Padding(
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
                      passwordController.text,
                      confirmPasswordController.text,
                    )
                    ? () {
                      if (formKey.currentState?.validate() ?? false) {
                        context.read<PasswordBloc>().add(
                          OnPressedRegisterEvent(
                            userName: userName,
                            userEmail: userEmail,
                            userPhone: userPhone,
                            userDepartment: userDepartment,
                            userPosition: userPosition,
                            userPassword: passwordController.text,
                            organizationName: organizationName,
                            organizationEmail: organizationEmail,
                          ),
                        );
                      }
                    }
                    : null,
            child: Text(context.l10n.register),
          ),
        ),
      ),
    );
  }

  bool _isEnabled(String password, String confirmPassword) {
    return password.isNotEmpty && confirmPassword.isNotEmpty;
  }
}
