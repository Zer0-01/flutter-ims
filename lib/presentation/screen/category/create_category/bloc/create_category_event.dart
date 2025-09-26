part of 'create_category_bloc.dart';

sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}

class OnPressedAddButtonEvent extends CreateCategoryEvent {
  final String name;

  const OnPressedAddButtonEvent({required this.name});

  @override
  List<Object> get props => [name];
}
