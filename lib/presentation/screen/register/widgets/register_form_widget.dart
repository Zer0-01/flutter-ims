import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

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
              validator: (value) {
                if (FormValidator.isEmpty(value)) {
                  return context.l10n.name_is_required;
                }
                return null;
              },
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if (FormValidator.isEmpty(value)) {
                  return context.l10n.email_is_required;
                }

                if (FormValidator.isNotValidEmail(value!)) {
                  return context.l10n.email_must_be_valid;
                }

                return null;
              },
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if (FormValidator.isEmpty(value)) {
                  return context.l10n.password_is_required;
                }

                if (FormValidator.isNotContainSixCharacters(value!)) {
                  return context.l10n.password_must_be_at_least_6_characters;
                }

                if (FormValidator.isNotAlphaNumeric(value)) {
                  return context.l10n.password_must_be_alpha_numeric;
                }

                return null;
              },
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if (FormValidator.isEmpty(value)) {
                  return context.l10n.confirm_password_is_required;
                }
                if (FormValidator.isPasswordNotMatch(
                  passwordController.text,
                  value!,
                )) {
                  return context.l10n.passwords_do_not_match;
                }
                return null;
              },
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
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
