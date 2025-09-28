import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/utils/extension.dart';

class ProductListAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductListAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(Icons.chevron_left),
      ),
      title: Text(context.l10n.products),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
