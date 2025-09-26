import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/add_button_widget.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/create_category_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/form_layout_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      body: CustomScrollView(
        slivers: [
          const CreateCategoryAppBarWidget(),
          FormLayoutWidget(
            nameController: _nameController,
            descriptionController: _descriptionController,
          ),
          AddButtonWidget(
            nameController: _nameController,
            descriptionController: _descriptionController,
          ),
        ],
      ),
    );
  }
}
