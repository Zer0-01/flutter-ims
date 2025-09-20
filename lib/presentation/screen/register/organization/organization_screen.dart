import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_email_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_headline_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_name_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/register_button_widget.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: const Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrganizationHeadlineWidget(),
          OrganizationNameFormWidget(),
          OrganizationEmailFormWidget(),
          RegisterButtonWidget(),
        ],
      ),
    );
  }
}
