import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/create_product_app_bar_widget.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CreateProductAppBarWidget());
  }
}
