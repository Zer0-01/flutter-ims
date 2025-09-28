import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/create_product_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/pricing_and_stock_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/product_basic_info_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      appBar: const CreateProductAppBarWidget(),
      body: const Column(
        children: [ProductBasicInfoWidget(), PricingAndStockWidget()],
      ),
    );
  }
}
