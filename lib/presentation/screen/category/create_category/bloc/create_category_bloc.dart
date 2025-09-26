import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/request/create_category_dto_request.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final AppLogger _logger = AppLogger.getLogger("CreateCategoryBloc");
  late final CategoryRepository _categoryRepository;

  CreateCategoryBloc({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,
      super(const CreateCategoryState()) {
    on<OnPressedAddButtonEvent>(_onPressedAddButtonEvent);
  }

  Future<void> _onPressedAddButtonEvent(
    OnPressedAddButtonEvent event,
    Emitter<CreateCategoryState> emit,
  ) async {
    _logger.debug("onPressedAddButton");
    final String name = event.name;
    _logger.debug("name: $name");
    await _postCategory(emit, name: name);
  }

  Future<void> _postCategory(
    Emitter<CreateCategoryState> emit, {
    required String name,
  }) async {
    _logger.debug("postCategory");
    try {
      emit(state.copyWith(postCategoryStatus: PostCategoryStatus.loading));

      final CreateCategoryDtoRequest createCategoryDtoRequest =
          CreateCategoryDtoRequest(name: name);

      await _categoryRepository.postCategory(
        createCategoryDtoRequest: createCategoryDtoRequest,
      );

      emit(state.copyWith(postCategoryStatus: PostCategoryStatus.success));
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      emit(
        state.copyWith(
          postCategoryStatus: PostCategoryStatus.failure,
          dioTypePostCategory: e.type,
          dioCodePostCategory: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("Error: $e");
      emit(state.copyWith(postCategoryStatus: PostCategoryStatus.failure));
    }
  }
}
