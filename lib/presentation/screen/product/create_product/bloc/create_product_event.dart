part of 'create_product_bloc.dart';

sealed class CreateProductEvent extends Equatable {
  const CreateProductEvent();

  @override
  List<Object> get props => [];
}

class OnPressedAddProductEvent extends CreateProductEvent {
  final String name;
  final String sku;
  final String costPrice;
  final String sellingPrice;
  final String category;
  final List<CategoriesData> categories;
  final String description;
  final String unit;

  const OnPressedAddProductEvent({
    required this.name,
    required this.sku,
    required this.costPrice,
    required this.sellingPrice,
    required this.category,
    required this.categories,
    required this.description,
    required this.unit,
  });

  @override
  List<Object> get props => [
    name,
    sku,
    costPrice,
    sellingPrice,
    category,
    categories,
    description,
    unit,
  ];
}

class OnPressedCategoryEvent extends CreateProductEvent {
  const OnPressedCategoryEvent();

  @override
  List<Object> get props => [];
}
