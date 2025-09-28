import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/bloc/create_product_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/create_product/create_product_screen.dart';

@RoutePage()
class CreateProductSetupScreen extends StatelessWidget {
  const CreateProductSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CreateProductBloc(productRepository: ProductRepository()),
      child: const CreateProductScreen(),
    );
  }
}
