import 'package:flutter/widgets.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/description_form_widget.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/name_form_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class FormLayoutWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  const FormLayoutWidget({
    super.key,
    required this.nameController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            spacing: 16,
            children: [
              NameFormWidget(nameController: nameController),
              DescriptionFormWidget(
                descriptionController: descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
