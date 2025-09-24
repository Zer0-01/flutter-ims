import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/home/widgets/user_name_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(title: UserNameWidget(), centerTitle: false);
  }
}
