import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const OnInitSplashEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Shtock")));
  }
}
