import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/models/response/product_list_dto_response.dart';
import 'package:flutter_ims/presentation/screen/home/bloc/home_bloc.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList.separated(
            itemCount: state.productListData.length,
            itemBuilder: (context, index) {
              final ProductListData productListData =
                  state.productListData[index];
              final String name = productListData.name;
              final String barcode = productListData.barcode;
              final String description = productListData.description;
              final double costPrice = productListData.costPrice;
              final double sellingPrice = productListData.sellingPrice;

              return Card(
                color: Colors.grey.shade800,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              barcode,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Colors.grey.shade400),
                            ),
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          spacing: 8,
                          children: [
                            Text(
                              costPrice.toString(),
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              sellingPrice.toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        );
      },
    );
  }
}
