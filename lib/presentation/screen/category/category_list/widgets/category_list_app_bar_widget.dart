import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class CategoryListAppBarWidget extends StatelessWidget {
  const CategoryListAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(Icons.chevron_left),
      ),
      title: Text(context.l10n.categories),
    );
  }
}
