import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/settings/widgets/logout_widget.dart';
import 'package:flutter_ims/presentation/screen/settings/widgets/settings_app_bar_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      appBar: const SettingsAppBarWidget(),
      body: const Column(children: [LogoutWidget()]),
    );
  }
}
