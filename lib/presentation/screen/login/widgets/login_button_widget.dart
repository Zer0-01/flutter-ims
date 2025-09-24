import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_ims/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen:
          (previous, current) =>
              previous.postLoginStatus != current.postLoginStatus,
      listener: (context, state) {
        if (state.postLoginStatus == PostLoginStatus.loading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const AppLoadingDialogWidget(),
          );
          return;
        }

        if (state.postLoginStatus == PostLoginStatus.failure) {
          Navigator.pop(context);
          const snackBar = SnackBar(content: Text('Failure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        if (state.postLoginStatus == PostLoginStatus.success) {
          Navigator.pop(context);
          context.router.replace(const HomeSetupRoute());
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed:
                _isEnabled(emailController.text, passwordController.text)
                    ? () {
                      context.read<LoginBloc>().add(
                        OnPressedLoginEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                    : null,
            child: Text(context.l10n.login),
          ),
        ),
      ),
    );
  }

  bool _isEnabled(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
