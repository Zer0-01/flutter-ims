part of 'create_product_bloc.dart';

sealed class CreateProductEvent extends Equatable {
  const CreateProductEvent();

  @override
  List<Object> get props => [];
}

class OnPressedAddProductEvent extends CreateProductEvent {
  const OnPressedAddProductEvent();

  @override
  List<Object> get props => [];
}
