import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDepartment;
  final String userPosition;
  final String organizationName;
  final String organizationEmail;

  const PasswordScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDepartment,
    required this.userPosition,
    required this.organizationName,
    required this.organizationEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
