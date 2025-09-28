import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';
import 'package:flutter_ims/presentation/screen/splash/bloc/splash_bloc.dart';
import 'package:flutter_ims/presentation/screen/splash/splash_screen.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';

@RoutePage()
class SplashSetupScreen extends StatelessWidget {
  const SplashSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(appSecureStorage: AppSecureStorage()),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen:
            (previous, current) =>
                previous.getAccessTokenStatus != current.getAccessTokenStatus,
        listener: (context, state) {
          if (state.getAccessTokenStatus == GetAccessTokenStatus.failure) {
            context.router.replace(const LoginSetupRoute());
            return;
          }

          if (state.getAccessTokenStatus == GetAccessTokenStatus.success) {
            if (state.isLogin) {
              context.router.replace(const RootSetupRoute());
              return;
            } else {
              context.router.replace(const LoginSetupRoute());
              return;
            }
          }
        },
        child: const SplashScreen(),
      ),
    );
  }
}
