part of 'home_bloc.dart';

enum GetProductsStatus { initial, loading, success, failure }

enum GetMeStatus { initial, loading, success, failure }

enum GetCategoryStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final GetProductsStatus getProductsStatus;
  final GetMeStatus getMeStatus;
  final GetCategoryStatus getCategoryStatus;
  final DioExceptionType dioTypeGetProducts;
  final DioExceptionType dioTypeGetMe;
  final DioExceptionType dioTypeGetCategory;
  final int dioCodeGetProducts;
  final int dioCodeGetMe;
  final int dioCodeGetCategory;
  final List<ProductListData> productListData;
  final String userName;
  final int categoriesTotal;
  final int productsTotal;

  const HomeState({
    this.getProductsStatus = GetProductsStatus.initial,
    this.getMeStatus = GetMeStatus.initial,
    this.getCategoryStatus = GetCategoryStatus.initial,
    this.dioTypeGetProducts = DioExceptionType.unknown,
    this.dioTypeGetMe = DioExceptionType.unknown,
    this.dioTypeGetCategory = DioExceptionType.unknown,
    this.dioCodeGetProducts = 0,
    this.dioCodeGetMe = 0,
    this.dioCodeGetCategory = 0,
    this.productListData = const [],
    this.userName = "",
    this.categoriesTotal = 0,
    this.productsTotal = 0,
  });

  HomeState copyWith({
    GetProductsStatus? getProductsStatus,
    GetMeStatus? getMeStatus,
    GetCategoryStatus? getCategoryStatus,
    DioExceptionType? dioTypeGetProducts,
    DioExceptionType? dioTypeGetMe,
    DioExceptionType? dioTypeGetCategory,
    int? dioCodeGetProducts,
    int? dioCodeGetMe,
    int? dioCodeGetCategory,
    List<ProductListData>? productListData,
    String? userName,
    int? categoriesTotal,
    int? productsTotal,
  }) {
    return HomeState(
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      getMeStatus: getMeStatus ?? this.getMeStatus,
      getCategoryStatus: getCategoryStatus ?? this.getCategoryStatus,
      dioTypeGetProducts: dioTypeGetProducts ?? this.dioTypeGetProducts,
      dioTypeGetMe: dioTypeGetMe ?? this.dioTypeGetMe,
      dioTypeGetCategory: dioTypeGetCategory ?? this.dioTypeGetCategory,
      dioCodeGetProducts: dioCodeGetProducts ?? this.dioCodeGetProducts,
      dioCodeGetMe: dioCodeGetMe ?? this.dioCodeGetMe,
      dioCodeGetCategory: dioCodeGetCategory ?? this.dioCodeGetCategory,
      productListData: productListData ?? this.productListData,
      userName: userName ?? this.userName,
      categoriesTotal: categoriesTotal ?? this.categoriesTotal,
      productsTotal: productsTotal ?? this.productsTotal,
    );
  }

  @override
  List<Object> get props => [
    getProductsStatus,
    getMeStatus,
    getCategoryStatus,
    dioTypeGetProducts,
    dioTypeGetMe,
    dioTypeGetCategory,
    dioCodeGetProducts,
    dioCodeGetMe,
    dioCodeGetCategory,
    productListData,
    userName,
    categoriesTotal,
    productsTotal,
  ];
}
