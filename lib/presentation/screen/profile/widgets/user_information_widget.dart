import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/presentation/screen/profile/bloc/profile_bloc.dart';
import 'package:flutter_ims/utils/extension.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              spacing: 8,
              children: [
                CircleAvatar(
                  minRadius: MediaQuery.of(context).size.width * 0.1,
                  backgroundColor: Colors.blue.shade50,
                  foregroundColor: Colors.blue,
                  child: Text(state.userName.initials),
                ),
                Text(
                  state.userName,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(state.userEmail),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color:
                            state.isVerified
                                ? Colors.green.shade50
                                : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: state.isVerified ? Colors.green : Colors.red,
                        ),
                      ),
                      child: Text(
                        state.isVerified
                            ? context.l10n.verified
                            : context.l10n.not_verified,
                        style: context.textTheme.labelMedium?.copyWith(
                          color: state.isVerified ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
