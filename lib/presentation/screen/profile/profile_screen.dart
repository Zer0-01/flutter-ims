import 'package:flutter/material.dart';
import 'package:flutter_ims/presentation/screen/profile/widgets/profile_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [const ProfileAppBarWidget()],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.red,
                child: const Text("Lah"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
