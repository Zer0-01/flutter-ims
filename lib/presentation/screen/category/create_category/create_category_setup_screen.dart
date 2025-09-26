import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/bloc/create_category_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/create_category/create_category_screen.dart';

@RoutePage()
class CreateCategorySetupScreen extends StatelessWidget {
  const CreateCategorySetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CreateCategoryBloc(categoryRepository: CategoryRepository()),
      child: const CreateCategoryScreen(),
    );
  }
}
