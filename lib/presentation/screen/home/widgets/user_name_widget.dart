import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.getMeStatus == GetMeStatus.failure) {
          return const Text("Error");
        }

        if (state.getMeStatus == GetMeStatus.loading ||
            state.getMeStatus == GetMeStatus.initial) {
          return Skeletonizer(child: Text(BoneMock.title));
        }

        if (state.getMeStatus == GetMeStatus.success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.welcome_back,
                style: context.textTheme.bodyMedium,
              ),
              Text(
                state.userName,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
