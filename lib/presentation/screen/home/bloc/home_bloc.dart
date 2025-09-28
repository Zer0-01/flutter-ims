import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';
import 'package:flutter_ims/data/models/response/me_dto_response.dart';
import 'package:flutter_ims/data/models/response/product_list_dto_response.dart';
import 'package:flutter_ims/data/models/response/products_dto_response.dart';
import 'package:flutter_ims/data/repository/auth_repository.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppLogger _logger = AppLogger.getLogger("HomeBloc");
  late final AuthRepository _authRepository;
  late final CategoryRepository _categoryRepository;
  late final ProductRepository _productRepository;

  HomeBloc({
    required AuthRepository authRepository,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  }) : _authRepository = authRepository,
       _categoryRepository = categoryRepository,
       _productRepository = productRepository,
       super(const HomeState()) {
    on<OnInitHomeEvent>(_onInitHome);
  }

  //PRIVATE EVENTS//
  Future<void> _onInitHome(
    OnInitHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    _logger.debug("onInitHome");
    await Future.wait([_getMe(emit), _getCategories(emit), _getProducts(emit)]);
  }

  //PRIVATE METHODS//
  Future<void> _getMe(Emitter<HomeState> emit) async {
    _logger.debug("getMe");

    try {
      emit(state.copyWith(getMeStatus: GetMeStatus.loading));

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

  Future<void> _getProducts(Emitter<HomeState> emit) async {
    _logger.debug("getProducts");
    try {
      emit(state.copyWith(getProductsStatus: GetProductsStatus.loading));

      final ProductsDtoResponse productListDtoResponse =
          await _productRepository.getProducts();
      final int productsTotal = productListDtoResponse.pagination.total;

      _logger.debug("productsTotal: $productsTotal");

      emit(
        state.copyWith(
          getProductsStatus: GetProductsStatus.success,
          productsTotal: productsTotal,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      emit(
        state.copyWith(
          getProductsStatus: GetProductsStatus.failure,
          dioTypeGetProducts: e.type,
          dioCodeGetProducts: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getProductsStatus: GetProductsStatus.failure,
          dioTypeGetProducts: DioExceptionType.unknown,
          dioCodeGetProducts: 0,
        ),
      );
    }
  }
}
