import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/bloc/product_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/product_list_screen.dart';

@RoutePage()
class ProductListSetupScreen extends StatelessWidget {
  const ProductListSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductListBloc(productRepository: ProductRepository()),
      child: const ProductListScreen(),
    );
  }
}
