part of 'create_product_bloc.dart';

enum PostProductStatus { initial, loading, success, failure }

class CreateProductState extends Equatable {
  final PostProductStatus postProductStatus;
  final DioExceptionType dioTypePostProduct;
  final int dioCodePostProduct;
  const CreateProductState({
    this.postProductStatus = PostProductStatus.initial,
    this.dioTypePostProduct = DioExceptionType.unknown,
    this.dioCodePostProduct = 0,
  });

  CreateProductState copyWith({
    PostProductStatus? postProductStatus,
    DioExceptionType? dioTypePostProduct,
    int? dioCodePostProduct,
  }) {
    return CreateProductState(
      postProductStatus: postProductStatus ?? this.postProductStatus,
      dioTypePostProduct: dioTypePostProduct ?? this.dioTypePostProduct,
      dioCodePostProduct: dioCodePostProduct ?? this.dioCodePostProduct,
    );
  }

  @override
  List<Object> get props => [
    postProductStatus,
    dioTypePostProduct,
    dioCodePostProduct,
  ];
}
