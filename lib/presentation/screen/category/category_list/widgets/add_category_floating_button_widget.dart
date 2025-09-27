import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/routes/app_router.gr.dart';

class AddCategoryFloatingButtonWidget extends StatelessWidget {
  const AddCategoryFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.router.push(const CreateCategorySetupRoute());
      },
      child: const Icon(Icons.add),
    );
  }
}
