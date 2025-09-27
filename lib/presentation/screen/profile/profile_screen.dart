import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/profile/bloc/profile_bloc.dart';
import 'package:flutter_ims/presentation/screen/profile/widgets/profile_app_bar_widget.dart';
import 'package:flutter_ims/presentation/screen/profile/widgets/user_information_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const OnInitProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [const ProfileAppBarWidget()],
        body: const CustomScrollView(slivers: [UserInformationWidget()]),
      ),
    );
  }
}
