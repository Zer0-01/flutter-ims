import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/bloc/category_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/widgets/category_list_app_bar_widget.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';
import 'package:flutter_ims/utils/extension.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryListBloc>().add(const OnInitCategoryListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      body: const CustomScrollView(slivers: [CategoryListAppBarWidget()]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const CreateCategorySetupRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
