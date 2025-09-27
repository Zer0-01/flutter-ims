part of 'category_list_bloc.dart';

enum GetCategoryListStatus { initial, loading, success, failure }

class CategoryListState extends Equatable {
  final GetCategoryListStatus getCategoryListStatus;
  final DioExceptionType dioTypeGetCategoryList;
  final int dioCodeGetCategoryList;
  final List<CategoriesData> categories;
  final int categoriesTotal;

  const CategoryListState({
    this.getCategoryListStatus = GetCategoryListStatus.initial,
    this.dioTypeGetCategoryList = DioExceptionType.unknown,
    this.dioCodeGetCategoryList = 0,
    this.categories = const [],
    this.categoriesTotal = 0,
  });

  CategoryListState copyWith({
    GetCategoryListStatus? getCategoryListStatus,
    DioExceptionType? dioTypeGetCategoryList,
    int? dioCodeGetCategoryList,
    List<CategoriesData>? categories,
    int? categoriesTotal,
  }) {
    return CategoryListState(
      getCategoryListStatus:
          getCategoryListStatus ?? this.getCategoryListStatus,
      dioTypeGetCategoryList:
          dioTypeGetCategoryList ?? this.dioTypeGetCategoryList,
      dioCodeGetCategoryList:
          dioCodeGetCategoryList ?? this.dioCodeGetCategoryList,
      categories: categories ?? this.categories,
      categoriesTotal: categoriesTotal ?? this.categoriesTotal,
    );
  }

  @override
  List<Object> get props => [
    getCategoryListStatus,
    dioTypeGetCategoryList,
    dioCodeGetCategoryList,
    categories,
    categoriesTotal,
  ];
}
