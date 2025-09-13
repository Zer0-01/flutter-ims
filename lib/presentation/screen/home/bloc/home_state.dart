part of 'home_bloc.dart';

enum GetProductListStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final GetProductListStatus getProductListStatus;
  final DioExceptionType dioTypeGetProductList;
  final int dioCodeGetProductList;
  final List<ProductListData> productListData;

  const HomeState({
    this.getProductListStatus = GetProductListStatus.initial,
    this.dioTypeGetProductList = DioExceptionType.unknown,
    this.dioCodeGetProductList = 0,
    this.productListData = const [],
  });

  HomeState copyWith({
    GetProductListStatus? getProductListStatus,
    DioExceptionType? dioTypeGetProductList,
    int? dioCodeGetProductList,
    List<ProductListData>? productListData,
  }) {
    return HomeState(
      getProductListStatus: getProductListStatus ?? this.getProductListStatus,
      dioTypeGetProductList:
          dioTypeGetProductList ?? this.dioTypeGetProductList,
      dioCodeGetProductList:
          dioCodeGetProductList ?? this.dioCodeGetProductList,
      productListData: productListData ?? this.productListData,
    );
  }

  @override
  List<Object> get props => [
    getProductListStatus,
    dioTypeGetProductList,
    dioCodeGetProductList,
    productListData,
  ];
}
