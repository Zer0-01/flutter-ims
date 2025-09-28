import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_local_storage.dart';
import 'package:flutter_ims/configuration/app_secure_storage.dart';
import 'package:flutter_ims/presentation/screen/settings/bloc/settings_bloc.dart';
import 'package:flutter_ims/presentation/screen/settings/settings_screen.dart';

@RoutePage()
class SettingsSetupScreen extends StatelessWidget {
  const SettingsSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SettingsBloc(
            appLocalStorage: AppLocalStorage(),
            appSecureStorage: AppSecureStorage(),
          ),
      child: const SettingsScreen(),
    );
  }
}
