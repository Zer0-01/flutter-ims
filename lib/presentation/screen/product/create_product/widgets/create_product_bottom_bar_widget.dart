import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/bloc/create_product_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';

class CreateProductBottomBarWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController skuController;
  final TextEditingController categoryController;
  final TextEditingController costPriceController;
  final TextEditingController sellingPriceController;
  final TextEditingController descriptionController;
  final TextEditingController unitController;

  const CreateProductBottomBarWidget({
    super.key,
    required this.nameController,
    required this.skuController,
    required this.categoryController,
    required this.costPriceController,
    required this.sellingPriceController,
    required this.descriptionController,
    required this.unitController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProductBloc, CreateProductState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.colorScheme.outline)),
          ),
          child: BottomAppBar(
            child: FilledButton(
              onPressed: () {
                context.read<CreateProductBloc>().add(
                  OnPressedAddProductEvent(
                    name: nameController.text,
                    sku: skuController.text,
                    costPrice: costPriceController.text,
                    sellingPrice: sellingPriceController.text,
                    category: categoryController.text,
                    categories: state.categories,
                    description: descriptionController.text,
                    unit: unitController.text,
                  ),
                );
              },
              child: Text(context.l10n.save),
            ),
          ),
        );
      },
    );
  }
}
