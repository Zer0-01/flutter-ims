import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/bloc/product_list_bloc.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/widgets/product_list_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/product/product_list/widgets/product_list_fab_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductListBloc>().add(const OnInitProductListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductListAppBarWidget(),
      floatingActionButton: ProductListFabWidget(),
    );
  }
}
