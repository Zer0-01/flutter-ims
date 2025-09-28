import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/create_product_screen.dart';

@RoutePage()
class CreateProductSetupScreen extends StatelessWidget {
  const CreateProductSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateProductScreen();
  }
}
