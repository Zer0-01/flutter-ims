import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_ims/presentation/screen/home/widgets/category_card_widget.dart';
import 'package:flutter_ims/presentation/screen/home/widgets/home_app_bar_widget.dart';
import 'package:flutter_ims/utils/extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const OnInitHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceDim,
      body: const CustomScrollView(
        slivers: [HomeAppBarWidget(), CategoryCardWidget()],
      ),
    );
  }
}
