import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_ims/presentation/screen/register/bloc/register_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';

class RegisterButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const RegisterButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen:
          (previous, current) =>
              previous.postRegisterStatus != current.postRegisterStatus,
      listener: (context, state) {
        if (state.postRegisterStatus == PostRegisterStatus.loading) {
          showDialog(
            context: context,
            builder: (context) => const AppLoadingDialogWidget(),
          );
          return;
        }

        if (state.postRegisterStatus == PostRegisterStatus.failure) {
          Navigator.pop(context);
          const snackBar = SnackBar(content: Text('Failure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        if (state.postRegisterStatus == PostRegisterStatus.success) {
          Navigator.pop(context);
          const snackBar = SnackBar(content: Text('Success'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<RegisterBloc>().add(
                  OnPressedRegisterEvent(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              }
            },
            child: Text(context.l10n.register),
          ),
        ),
      ),
    );
  }
}
