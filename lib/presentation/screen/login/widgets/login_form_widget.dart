import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:flutter_ims/utils/form_validator.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (FormValidator.isEmpty(value)) {
                      return context.l10n.email_is_required;
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
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.redAccent,
                      ),
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

                    return null;
                  },
                  obscureText: state.isObscurePassword,
                  decoration: InputDecoration(
                    hintText: context.l10n.password,
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      onTap:
                          () => context.read<LoginBloc>().add(
                            OnPressedObscurePasswordEvent(
                              isObscurePassword: state.isObscurePassword,
                            ),
                          ),
                      child: Icon(
                        state.isObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
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
      },
    );
  }
}
