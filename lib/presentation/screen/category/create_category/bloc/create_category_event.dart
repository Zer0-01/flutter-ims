part of 'create_category_bloc.dart';

sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object> get props => [];
}

class OnPressedAddButtonEvent extends CreateCategoryEvent {
  final String name;
  final String description;

  const OnPressedAddButtonEvent({
    required this.name,
    required this.description,
  });

  @override
  List<Object> get props => [name, description];
}
