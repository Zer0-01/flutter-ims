import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/models/response/products_dto_response.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/bloc/product_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/widgets/product_card_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList.separated(
            itemCount: state.products.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final ProductsData product = state.products[index];
              final String name = product.name;
              final String sku = product.sku;
              final String sellingPrice = product.sellingPrice.toString();
              final String unit = product.unit;
              final String description = product.description;

              return ProductCardWidget(
                name: name,
                description: description,
                sku: sku,
                sellingPrice: sellingPrice,
                unit: unit,
              );
            },
          ),
        );
      },
    );
  }
}
