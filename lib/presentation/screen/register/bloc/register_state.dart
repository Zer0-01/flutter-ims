part of 'register_bloc.dart';

enum PostRegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final DioExceptionType dioTypePostRegister;
  final int dioCodePostRegister;

  const RegisterState({
    this.postRegisterStatus = PostRegisterStatus.initial,
    this.dioTypePostRegister = DioExceptionType.unknown,
    this.dioCodePostRegister = 0,
  });

  RegisterState copyWith({
    PostRegisterStatus? postRegisterStatus,
    DioExceptionType? dioTypePostRegister,
    int? dioCodePostRegister,
  }) {
    return RegisterState(
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
