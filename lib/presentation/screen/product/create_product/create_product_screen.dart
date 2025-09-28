import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/create_product_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/create_product_bottom_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/details_and_description_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/pricing_and_stock_widget.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/widgets/product_basic_info_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _skuController;
  late final TextEditingController _categoryController;
  late final TextEditingController _costPriceController;
  late final TextEditingController _sellingPriceController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _unitController;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
    _nameController = TextEditingController();
    _skuController = TextEditingController();
    _costPriceController = TextEditingController();
    _sellingPriceController = TextEditingController();
    _descriptionController = TextEditingController();
    _unitController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _skuController.dispose();
    _costPriceController.dispose();
    _sellingPriceController.dispose();
    _descriptionController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      appBar: const CreateProductAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductBasicInfoWidget(
              categoryController: _categoryController,
              nameController: _nameController,
              skuController: _skuController,
            ),
            PricingAndStockWidget(
              costPriceController: _costPriceController,
              sellingPriceController: _sellingPriceController,
            ),
            DetailsAndDescriptionWidget(
              descriptionController: _descriptionController,
              unitController: _unitController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CreateProductBottomBarWidget(
        nameController: _nameController,
        categoryController: _categoryController,
        skuController: _skuController,
        costPriceController: _costPriceController,
        sellingPriceController: _sellingPriceController,
        descriptionController: _descriptionController,
        unitController: _unitController,
      ),
    );
  }
}
