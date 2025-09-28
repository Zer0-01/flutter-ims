import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final AppLogger _logger = AppLogger.getLogger("ProductListBloc");
  late final ProductRepository _productRepository;

  ProductListBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(const ProductListState()) {
    on<OnInitProductListEvent>(_onInitProductListEvent);
  }

  Future<void> _onInitProductListEvent(
    OnInitProductListEvent event,
    Emitter<ProductListState> emit,
  ) async {
    _logger.debug("onInitProductList");
    await Future.wait([_getProducts(emit)]);
  }

  Future<void> _getProducts(Emitter<ProductListState> emit) async {
    _logger.debug("getProducts");

    try {
      emit(state.copyWith(getProductsStatus: GetProductsStatus.loading));

      await _productRepository.getProducts();

      emit(state.copyWith(getProductsStatus: GetProductsStatus.success));
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      _logger.error("DioExceptionType: ${e.type}");

      emit(
        state.copyWith(
          getProductsStatus: GetProductsStatus.failure,
          dioTypeGetProducts: e.type,
          dioCodeGetProducts: e.response?.statusCode,
        ),
      );
    } catch (e) {
      _logger.error("Error: $e");
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
