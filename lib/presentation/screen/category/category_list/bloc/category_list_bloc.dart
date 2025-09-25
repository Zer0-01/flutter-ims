import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final AppLogger _logger = AppLogger.getLogger("CategoryListBloc");
  late final CategoryRepository _categoryRepository;

  CategoryListBloc({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository,
      super(const CategoryListState()) {
    on<OnInitCategoryListEvent>(_onInitCategoryListEvent);
  }

  //PRIVATE EVENTS//
  Future<void> _onInitCategoryListEvent(
    OnInitCategoryListEvent event,
    Emitter<CategoryListState> emit,
  ) async {
    _logger.debug("onInitCategoryList");
    await Future.wait([_getCategories(emit)]);
  }

  //PRIVATE METHODS//
  Future<void> _getCategories(Emitter<CategoryListState> emit) async {
    _logger.debug("getCategories");
    try {
      emit(
        state.copyWith(getCategoryListStatus: GetCategoryListStatus.loading),
      );

      final CategoriesDtoResponse categoriesDtoResponse =
          await _categoryRepository.getCategories();

      final int categoriesTotal = categoriesDtoResponse.pagination.total;

      _logger.debug("categoriesTotal: $categoriesTotal");

      emit(
        state.copyWith(
          getCategoryListStatus: GetCategoryListStatus.success,
          categoriesTotal: categoriesTotal,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      emit(
        state.copyWith(
          getCategoryListStatus: GetCategoryListStatus.failure,
          dioTypeGetCategoryList: e.type,
          dioCodeGetCategoryList: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getCategoryListStatus: GetCategoryListStatus.failure,
          dioTypeGetCategoryList: DioExceptionType.unknown,
          dioCodeGetCategoryList: 0,
        ),
      );
    }
  }
}
