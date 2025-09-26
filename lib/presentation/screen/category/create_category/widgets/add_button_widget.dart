import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/bloc/create_category_bloc.dart';

class AddButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;

  const AddButtonWidget({
    super.key,
    required this.nameController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: FilledButton(
          onPressed: () {
            context.read<CreateCategoryBloc>().add(
              OnPressedAddButtonEvent(
                name: nameController.text,
                description: descriptionController.text,
              ),
            );
          },
          child: const Text("Add"),
        ),
      ),
    );
  }
}
