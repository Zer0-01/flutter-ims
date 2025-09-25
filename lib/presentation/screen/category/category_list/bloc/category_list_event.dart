part of 'category_list_bloc.dart';

sealed class CategoryListEvent extends Equatable {
  const CategoryListEvent();

  @override
  List<Object> get props => [];
}

class OnInitCategoryListEvent extends CategoryListEvent {
  const OnInitCategoryListEvent();

  @override
  List<Object> get props => [];
}
