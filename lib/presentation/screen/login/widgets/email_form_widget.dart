import 'package:flutter/widgets.dart';
import 'package:flutter_ims/presentation/common_widgets/app_text_form_field_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class EmailFormWidget extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormWidget({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return AppTextFormFieldWidget(
      controller: emailController,

      label: Text(context.l10n.email),
    );
  }
}
