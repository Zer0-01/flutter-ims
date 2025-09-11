import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class RegisterFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterFormWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: context.l10n.name,
                hintStyle: TextStyle(color: Colors.grey.shade300),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.person_outline, color: Colors.redAccent),
                ),
                prefixIconConstraints: const BoxConstraints(),
              ),
            ),
            const Divider(height: 0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: context.l10n.email,
                hintStyle: TextStyle(color: Colors.grey.shade300),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.email_outlined, color: Colors.redAccent),
                ),
                prefixIconConstraints: const BoxConstraints(),
              ),
            ),
            const Divider(height: 0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: context.l10n.password,
                hintStyle: TextStyle(color: Colors.grey.shade300),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.lock_outline, color: Colors.redAccent),
                ),
                prefixIconConstraints: const BoxConstraints(),
              ),
            ),
            const Divider(height: 0),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                hintText: context.l10n.confirm_password,
                hintStyle: TextStyle(color: Colors.grey.shade300),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.lock_outline, color: Colors.redAccent),
                ),
                prefixIconConstraints: const BoxConstraints(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
