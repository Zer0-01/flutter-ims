import 'package:flutter/widgets.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class PasswordFormWidget extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordFormWidget({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      controller: passwordController,
      label: Text(context.l10n.password),
    );
  }
}
