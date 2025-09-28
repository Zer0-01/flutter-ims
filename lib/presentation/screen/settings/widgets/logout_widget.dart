import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/common_widgets/app_loading_dialog_widget.dart';
import 'package:flutter_ims/presentation/screen/settings/bloc/settings_bloc.dart';
import 'package:flutter_ims/presentation/screen/settings/widgets/logout_dialog_widget.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listenWhen:
          (previous, current) =>
              previous.postLogoutStatus != current.postLogoutStatus,
      listener: (context, state) {
        if (state.postLogoutStatus == PostLogoutStatus.loading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const AppLoadingDialogWidget(),
          );
          return;
        }

        if (state.postLogoutStatus == PostLogoutStatus.failure) {
          Navigator.pop(context);
          const snackBar = SnackBar(content: Text('Failure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }

        if (state.postLogoutStatus == PostLogoutStatus.success) {
          Navigator.pop(context);
          context.router.replaceAll([
            const LoginSetupRoute(),
          ], updateExistingRoutes: false);
          return;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),

          child: ListTile(
            onTap: () async {
              final bool? isLogout = await showDialog(
                context: context,
                builder: (context) {
                  return const LogoutDialogWidget();
                },
              );

              if (isLogout == true) {
                if (!context.mounted) return;
                context.read<SettingsBloc>().add(const OnPressedLogoutEvent());
              }
            },
            leading: Icon(Icons.logout, color: context.colorScheme.error),
            title: Text(
              context.l10n.logout,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
