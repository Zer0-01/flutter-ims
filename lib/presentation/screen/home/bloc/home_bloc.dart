import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';
import 'package:flutter_ims/data/models/response/me_dto_response.dart';
import 'package:flutter_ims/data/models/response/product_list_dto_response.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppLogger _logger = AppLogger.getLogger("HomeBloc");
  late final AuthRepository _authRepository;
  late final CategoryRepository _categoryRepository;

  HomeBloc({
    required AuthRepository authRepository,
    required CategoryRepository categoryRepository,
  }) : _authRepository = authRepository,
       _categoryRepository = categoryRepository,
       super(const HomeState()) {
    on<OnInitHomeEvent>(_onInitHome);
  }

  //PRIVATE EVENTS//
  Future<void> _onInitHome(
    OnInitHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    _logger.debug("onInitHome");
    await Future.wait([_getMe(emit), _getCategories(emit)]);
  }

  //PRIVATE METHODS//
  Future<void> _getMe(Emitter<HomeState> emit) async {
    _logger.debug("getMe");

    try {
      emit(state.copyWith(getMeStatus: GetMeStatus.loading));

      await Future.delayed(const Duration(seconds: 5));

      final MeDtoResponse meDtoResponse = await _authRepository.getMe();
      final String userName = meDtoResponse.data.name;

      _logger.debug("userName: $userName");

      emit(
        state.copyWith(getMeStatus: GetMeStatus.success, userName: userName),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          getMeStatus: GetMeStatus.failure,
          dioTypeGetMe: e.type,
          dioCodeGetMe: e.response?.statusCode,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getMeStatus: GetMeStatus.failure,
          dioTypeGetMe: DioExceptionType.unknown,
        ),
      );
    }
  }

  Future<void> _getCategories(Emitter<HomeState> emit) async {
    _logger.debug("getCategories");
    try {
      emit(state.copyWith(getCategoryStatus: GetCategoryStatus.loading));

      final CategoriesDtoResponse categoriesDtoResponse =
          await _categoryRepository.getCategories();

      final int categoriesTotal = categoriesDtoResponse.pagination.total;

      _logger.debug("categoriesTotal: $categoriesTotal");

      emit(
        state.copyWith(
          getCategoryStatus: GetCategoryStatus.success,
          categoriesTotal: categoriesTotal,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      emit(
        state.copyWith(
          getCategoryStatus: GetCategoryStatus.failure,
          dioTypeGetCategory: e.type,
          dioCodeGetCategory: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getCategoryStatus: GetCategoryStatus.failure,
          dioTypeGetCategory: DioExceptionType.unknown,
          dioCodeGetCategory: 0,
        ),
      );
    }
  }
}
