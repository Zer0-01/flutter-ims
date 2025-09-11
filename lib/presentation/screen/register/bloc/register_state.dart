part of 'register_bloc.dart';

enum PostRegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final PostRegisterStatus postRegisterStatus;
  final DioExceptionType dioTypePostRegister;
  final int dioCodePostRegister;
  final bool isObscurePassword;
  final bool isObscureConfirmPassword;

  const RegisterState({
    this.postRegisterStatus = PostRegisterStatus.initial,
    this.dioTypePostRegister = DioExceptionType.unknown,
    this.dioCodePostRegister = 0,
    this.isObscurePassword = true,
    this.isObscureConfirmPassword = true,
  });

  RegisterState copyWith({
    PostRegisterStatus? postRegisterStatus,
    DioExceptionType? dioTypePostRegister,
    int? dioCodePostRegister,
    bool? isObscurePassword,
    bool? isObscureConfirmPassword,
  }) {
    return RegisterState(
      postRegisterStatus: postRegisterStatus ?? this.postRegisterStatus,
      dioTypePostRegister: dioTypePostRegister ?? this.dioTypePostRegister,
      dioCodePostRegister: dioCodePostRegister ?? this.dioCodePostRegister,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      isObscureConfirmPassword:
          isObscureConfirmPassword ?? this.isObscureConfirmPassword,
    );
  }

  @override
  List<Object> get props => [
    postRegisterStatus,
    dioTypePostRegister,
    dioCodePostRegister,
    isObscurePassword,
    isObscureConfirmPassword,
  ];
}
