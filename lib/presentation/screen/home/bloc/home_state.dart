part of 'home_bloc.dart';

enum GetProductListStatus { initial, loading, success, failure }

enum GetMeStatus { initial, loading, success, failure }

enum GetCategoryStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final GetProductListStatus getProductListStatus;
  final GetMeStatus getMeStatus;
  final GetCategoryStatus getCategoryStatus;
  final DioExceptionType dioTypeGetProductList;
  final DioExceptionType dioTypeGetMe;
  final DioExceptionType dioTypeGetCategory;
  final int dioCodeGetProductList;
  final int dioCodeGetMe;
  final int dioCodeGetCategory;
  final List<ProductListData> productListData;
  final String userName;
  final int categoriesTotal;

  const HomeState({
    this.getProductListStatus = GetProductListStatus.initial,
    this.getMeStatus = GetMeStatus.initial,
    this.getCategoryStatus = GetCategoryStatus.initial,
    this.dioTypeGetProductList = DioExceptionType.unknown,
    this.dioTypeGetMe = DioExceptionType.unknown,
    this.dioTypeGetCategory = DioExceptionType.unknown,
    this.dioCodeGetProductList = 0,
    this.dioCodeGetMe = 0,
    this.dioCodeGetCategory = 0,
    this.productListData = const [],
    this.userName = "",
    this.categoriesTotal = 0,
  });

  HomeState copyWith({
    GetProductListStatus? getProductListStatus,
    GetMeStatus? getMeStatus,
    GetCategoryStatus? getCategoryStatus,
    DioExceptionType? dioTypeGetProductList,
    DioExceptionType? dioTypeGetMe,
    DioExceptionType? dioTypeGetCategory,
    int? dioCodeGetProductList,
    int? dioCodeGetMe,
    int? dioCodeGetCategory,
    List<ProductListData>? productListData,
    String? userName,
    int? categoriesTotal,
  }) {
    return HomeState(
      getProductListStatus: getProductListStatus ?? this.getProductListStatus,
      getMeStatus: getMeStatus ?? this.getMeStatus,
      getCategoryStatus: getCategoryStatus ?? this.getCategoryStatus,
      dioTypeGetProductList:
          dioTypeGetProductList ?? this.dioTypeGetProductList,
      dioTypeGetMe: dioTypeGetMe ?? this.dioTypeGetMe,
      dioTypeGetCategory: dioTypeGetCategory ?? this.dioTypeGetCategory,
      dioCodeGetProductList:
          dioCodeGetProductList ?? this.dioCodeGetProductList,
      dioCodeGetMe: dioCodeGetMe ?? this.dioCodeGetMe,
      dioCodeGetCategory: dioCodeGetCategory ?? this.dioCodeGetCategory,
      productListData: productListData ?? this.productListData,
      userName: userName ?? this.userName,
      categoriesTotal: categoriesTotal ?? this.categoriesTotal,
    );
  }

  @override
  List<Object> get props => [
    getProductListStatus,
    getMeStatus,
    getCategoryStatus,
    dioTypeGetProductList,
    dioTypeGetMe,
    dioTypeGetCategory,
    dioCodeGetProductList,
    dioCodeGetMe,
    dioCodeGetCategory,
    productListData,
    userName,
    categoriesTotal,
  ];
}
