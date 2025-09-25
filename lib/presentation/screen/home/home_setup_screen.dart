import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';
import 'package:flutter_ims/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_ims/presentation/screen/home/home_screen.dart';

@RoutePage()
class HomeSetupScreen extends StatelessWidget {
  const HomeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeBloc(
            authRepository: AuthRepository(),
            categoryRepository: CategoryRepository(),
          ),
      child: const HomeScreen(),
    );
  }
}
