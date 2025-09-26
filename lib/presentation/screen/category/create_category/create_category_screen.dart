import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/add_button_widget.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/create_category_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/widgets/name_form_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      body: CustomScrollView(
        slivers: [
          const CreateCategoryAppBarWidget(),
          NameFormWidget(nameController: _nameController),
          AddButtonWidget(nameController: _nameController),
        ],
      ),
    );
  }
}
