part of 'password_bloc.dart';

enum PostRegisterStatus { initial, loading, success, failure }

class PasswordState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final DioExceptionType dioTypePostRegister;
  final int dioCodePostRegister;

  const PasswordState({
    this.postRegisterStatus = PostRegisterStatus.initial,
    this.dioTypePostRegister = DioExceptionType.unknown,
    this.dioCodePostRegister = 0,
  });

  PasswordState copyWith({
    PostRegisterStatus? postRegisterStatus,
    DioExceptionType? dioTypePostRegister,
    int? dioCodePostRegister,
  }) {
    return PasswordState(
      postRegisterStatus: postRegisterStatus ?? this.postRegisterStatus,
      dioTypePostRegister: dioTypePostRegister ?? this.dioTypePostRegister,
      dioCodePostRegister: dioCodePostRegister ?? this.dioCodePostRegister,
    );
  }

  @override
  List<Object> get props => [
    postRegisterStatus,
    dioTypePostRegister,
    dioCodePostRegister,
  ];
}
