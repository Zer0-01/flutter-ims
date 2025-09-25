import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/bloc/category_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/category_list_screen.dart';

@RoutePage()
class CategoryListSetupScreen extends StatelessWidget {
  const CategoryListSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CategoryListBloc(categoryRepository: CategoryRepository()),
      child: const CategoryListScreen(),
    );
  }
}
