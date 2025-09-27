import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/bloc/category_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/widgets/add_category_floating_button_widget.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/widgets/category_list_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/widgets/category_list_widget.dart';
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
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => const [CategoryListAppBarWidget()],
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<CategoryListBloc>().add(
              const OnRefreshCategoryListEvent(),
            );
          },
          child: const CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [CategoryListWidget()],
          ),
        ),
      ),
      floatingActionButton: const AddCategoryFloatingButtonWidget(),
    );
  }
}
