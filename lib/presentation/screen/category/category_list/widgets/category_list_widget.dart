import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/bloc/category_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/category/category_list/widgets/category_card_widget.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder: (context, state) {
        if (state.getCategoryListStatus == GetCategoryListStatus.initial ||
            state.getCategoryListStatus == GetCategoryListStatus.loading) {
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Skeletonizer(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        BoneMock.title,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(BoneMock.subtitle),
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (state.getCategoryListStatus == GetCategoryListStatus.failure) {
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Icon(Icons.error, color: context.colorScheme.error),
                  title: const Text("Error failed to get categories"),
                ),
              ),
            ),
          );
        }

        if (state.getCategoryListStatus == GetCategoryListStatus.success) {
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              itemCount: state.categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final CategoriesData category = state.categories[index];
                final String name = category.name;
                final String description = category.description ?? "";
                return CategoryCardWidget(name: name, description: description);
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
