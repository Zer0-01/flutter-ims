part of 'product_list_bloc.dart';

enum GetProductsStatus { initial, loading, success, failure }

class ProductListState extends Equatable {
  final GetProductsStatus getProductsStatus;
  final DioExceptionType dioTypeGetProducts;
  final int dioCodeGetProducts;
  final List<ProductsData> products;

  const ProductListState({
    this.getProductsStatus = GetProductsStatus.initial,
    this.dioTypeGetProducts = DioExceptionType.unknown,
    this.dioCodeGetProducts = 0,
    this.products = const [],
  });

  ProductListState copyWith({
    GetProductsStatus? getProductsStatus,
    DioExceptionType? dioTypeGetProducts,
    int? dioCodeGetProducts,
    List<ProductsData>? products,
  }) {
    return ProductListState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      dioTypeGetProducts: dioTypeGetProducts ?? this.dioTypeGetProducts,
      dioCodeGetProducts: dioCodeGetProducts ?? this.dioCodeGetProducts,
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [
    getProductsStatus,
    dioTypeGetProducts,
    dioCodeGetProducts,
    products,
  ];
}
