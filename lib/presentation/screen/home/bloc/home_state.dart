part of 'home_bloc.dart';

enum GetProductListStatus { initial, loading, success, failure }

enum GetMeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final GetProductListStatus getProductListStatus;
  final GetMeStatus getMeStatus;
  final DioExceptionType dioTypeGetProductList;
  final DioExceptionType dioTypeGetMe;
  final int dioCodeGetProductList;
  final int dioCodeGetMe;
  final List<ProductListData> productListData;
  final String userName;

  const HomeState({
    this.getProductListStatus = GetProductListStatus.initial,
    this.getMeStatus = GetMeStatus.initial,
    this.dioTypeGetProductList = DioExceptionType.unknown,
    this.dioTypeGetMe = DioExceptionType.unknown,
    this.dioCodeGetProductList = 0,
    this.dioCodeGetMe = 0,
    this.productListData = const [],
    this.userName = "",
  });

  HomeState copyWith({
    GetProductListStatus? getProductListStatus,
    GetMeStatus? getMeStatus,
    DioExceptionType? dioTypeGetProductList,
    DioExceptionType? dioTypeGetMe,
    int? dioCodeGetProductList,
    int? dioCodeGetMe,
    List<ProductListData>? productListData,
    String? userName,
  }) {
    return HomeState(
      getProductListStatus: getProductListStatus ?? this.getProductListStatus,
      getMeStatus: getMeStatus ?? this.getMeStatus,
      dioTypeGetProductList:
          dioTypeGetProductList ?? this.dioTypeGetProductList,
      dioTypeGetMe: dioTypeGetMe ?? this.dioTypeGetMe,
      dioCodeGetProductList:
          dioCodeGetProductList ?? this.dioCodeGetProductList,
      dioCodeGetMe: dioCodeGetMe ?? this.dioCodeGetMe,
      productListData: productListData ?? this.productListData,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object> get props => [
    getProductListStatus,
    getMeStatus,
    dioTypeGetProductList,
    dioTypeGetMe,
    dioCodeGetProductList,
    dioCodeGetMe,
    productListData,
    userName,
  ];
}
