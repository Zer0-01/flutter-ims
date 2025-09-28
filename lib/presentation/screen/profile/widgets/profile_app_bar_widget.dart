import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            context.router.push(const SettingsSetupRoute());
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
