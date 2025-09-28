part of 'create_product_bloc.dart';

enum PostProductStatus { initial, loading, success, failure }

enum GetCategoriesStatus { initial, loading, success, failure }

class CreateProductState extends Equatable {
  final PostProductStatus postProductStatus;
  final GetCategoriesStatus getCategoriesStatus;
  final DioExceptionType dioTypePostProduct;
  final DioExceptionType dioTypeGetCategories;
  final int dioCodePostProduct;
  final int dioCodeGetCategories;
  final List<CategoriesData> categories;

  const CreateProductState({
    this.postProductStatus = PostProductStatus.initial,
    this.getCategoriesStatus = GetCategoriesStatus.initial,
    this.dioTypePostProduct = DioExceptionType.unknown,
    this.dioTypeGetCategories = DioExceptionType.unknown,
    this.dioCodePostProduct = 0,
    this.dioCodeGetCategories = 0,
    this.categories = const [],
  });

  CreateProductState copyWith({
    PostProductStatus? postProductStatus,
    GetCategoriesStatus? getCategoriesStatus,
    DioExceptionType? dioTypePostProduct,
    DioExceptionType? dioTypeGetCategories,
    int? dioCodePostProduct,
    int? dioCodeGetCategories,
    List<CategoriesData>? categories,
  }) {
    return CreateProductState(
      postProductStatus: postProductStatus ?? this.postProductStatus,
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      dioTypePostProduct: dioTypePostProduct ?? this.dioTypePostProduct,
      dioTypeGetCategories: dioTypeGetCategories ?? this.dioTypeGetCategories,
      dioCodePostProduct: dioCodePostProduct ?? this.dioCodePostProduct,
      dioCodeGetCategories: dioCodeGetCategories ?? this.dioCodeGetCategories,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [
    postProductStatus,
    getCategoriesStatus,
    dioTypePostProduct,
    dioTypeGetCategories,
    dioCodePostProduct,
    dioCodeGetCategories,
    categories,
  ];
}
