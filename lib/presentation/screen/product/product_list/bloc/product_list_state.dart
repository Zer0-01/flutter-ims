part of 'product_list_bloc.dart';

enum GetProductsStatus { initial, loading, success, failure }

class ProductListState extends Equatable {
  final GetProductsStatus getProductsStatus;
  final DioExceptionType dioTypeGetProducts;
  final int dioCodeGetProducts;

  const ProductListState({
    this.getProductsStatus = GetProductsStatus.initial,
    this.dioTypeGetProducts = DioExceptionType.unknown,
    this.dioCodeGetProducts = 0,
  });

  ProductListState copyWith({
    GetProductsStatus? getProductsStatus,
    DioExceptionType? dioTypeGetProducts,
    int? dioCodeGetProducts,
  }) {
    return ProductListState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      dioTypeGetProducts: dioTypeGetProducts ?? this.dioTypeGetProducts,
      dioCodeGetProducts: dioCodeGetProducts ?? this.dioCodeGetProducts,
    );
  }

  @override
  List<Object> get props => [
    getProductsStatus,
    dioTypeGetProducts,
    dioCodeGetProducts,
  ];
}
