import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/organization/organization_screen.dart';

@RoutePage()
class OrganizationSetupScreen extends StatelessWidget {
  const OrganizationSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrganizationScreen();
  }
}
