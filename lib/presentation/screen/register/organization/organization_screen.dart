import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/continue_button_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_email_form_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_headline_widget.dart';
import 'package:flutter_ims/presentation/screen/register/organization/widgets/organization_name_form_widget.dart';

class OrganizationScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;

  const OrganizationScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
  });

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  late final TextEditingController organizationNameController;
  late final TextEditingController organizationEmailController;

  @override
  void initState() {
    super.initState();
    organizationNameController = TextEditingController();
    organizationEmailController = TextEditingController();

    organizationNameController.addListener(_onChanged);
    organizationEmailController.addListener(_onChanged);
  }

  @override
  void dispose() {
    organizationNameController.dispose();
    organizationEmailController.dispose();
    super.dispose();
  }

  void _onChanged() {
    setState(() {});
  }

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
      body: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrganizationHeadlineWidget(),
          OrganizationNameFormWidget(
            organizationNameController: organizationNameController,
          ),
          OrganizationEmailFormWidget(
            organizationEmailController: organizationEmailController,
          ),
          ContinueButtonWidget(
            organizationNameController: organizationNameController,
            organizationEmailController: organizationEmailController,
            userName: widget.userName,
            userEmail: widget.userEmail,
            userPhone: widget.userPhone,
            userDepartment: widget.userDepartment,
            userPosition: widget.userPosition,
          ),
        ],
      ),
    );
  }
}
