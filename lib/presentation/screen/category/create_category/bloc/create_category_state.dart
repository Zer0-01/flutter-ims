part of 'create_category_bloc.dart';

enum PostCategoryStatus { initial, loading, success, failure, unauthorized }

class CreateCategoryState extends Equatable {
  final PostCategoryStatus postCategoryStatus;
  final DioExceptionType dioTypePostCategory;
  final int dioCodePostCategory;

  const CreateCategoryState({
    this.postCategoryStatus = PostCategoryStatus.initial,
    this.dioTypePostCategory = DioExceptionType.unknown,
    this.dioCodePostCategory = 0,
  });

  CreateCategoryState copyWith({
    PostCategoryStatus? postCategoryStatus,
    DioExceptionType? dioTypePostCategory,
    int? dioCodePostCategory,
  }) {
    return CreateCategoryState(
      postCategoryStatus: postCategoryStatus ?? this.postCategoryStatus,
      dioTypePostCategory: dioTypePostCategory ?? this.dioTypePostCategory,
      dioCodePostCategory: dioCodePostCategory ?? this.dioCodePostCategory,
    );
  }

  @override
  List<Object> get props => [
    postCategoryStatus,
    dioTypePostCategory,
    dioCodePostCategory,
  ];
}
