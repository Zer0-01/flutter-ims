part of 'profile_bloc.dart';

enum GetMeStatus { initial, loading, success, failure, unauthorized }

class ProfileState extends Equatable {
  final GetMeStatus getMeStatus;
  final DioExceptionType dioTypeGetMe;
  final int dioCodeGetMe;
  final String userName;
  final String userEmail;
  final bool isVerified;

  const ProfileState({
    this.getMeStatus = GetMeStatus.initial,
    this.dioTypeGetMe = DioExceptionType.unknown,
    this.dioCodeGetMe = 0,
    this.userName = "",
    this.userEmail = "",
    this.isVerified = false,
  });

  ProfileState copyWith({
    GetMeStatus? getMeStatus,
    DioExceptionType? dioTypeGetMe,
    int? dioCodeGetMe,
    String? userName,
    String? userEmail,
    bool? isVerified,
  }) {
    return ProfileState(
      getMeStatus: getMeStatus ?? this.getMeStatus,
      dioTypeGetMe: dioTypeGetMe ?? this.dioTypeGetMe,
      dioCodeGetMe: dioCodeGetMe ?? this.dioCodeGetMe,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  List<Object> get props => [
    getMeStatus,
    dioTypeGetMe,
    dioCodeGetMe,
    userName,
    userEmail,
    isVerified,
  ];
}
