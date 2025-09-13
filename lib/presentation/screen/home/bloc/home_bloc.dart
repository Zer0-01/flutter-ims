import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/product_list_dto_response.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppLogger _logger = AppLogger.getLogger("HomeBloc");
  HomeBloc() : super(const HomeState()) {
    on<OnInitHomeEvent>(_onInitHome);
  }

  //PRIVATE EVENTS//
  Future<void> _onInitHome(
    OnInitHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    _logger.debug("onInitHome");

    _getProductList(emit);
  }

  //PRIVATE METHODS//
  Future<void> _getProductList(Emitter<HomeState> emit) async {
    _logger.debug("getProductList");

    try {
      emit(state.copyWith(getProductListStatus: GetProductListStatus.loading));

      final List<ProductListData> mockDataListPage = [
        ProductListData(
          name: "Apple iPhone 15",
          barcode: "IP15-001",
          description: "Latest Apple flagship smartphone",
          costPrice: 800.0,
          sellingPrice: 1099.0,
        ),
        ProductListData(
          name: "Samsung Galaxy S24",
          barcode: "SGS24-002",
          description: "High-end Samsung smartphone with AMOLED display",
          costPrice: 750.0,
          sellingPrice: 999.0,
        ),
        ProductListData(
          name: "Google Pixel 9",
          barcode: "GP9-003",
          description: "Pure Android experience with excellent camera",
          costPrice: 700.0,
          sellingPrice: 949.0,
        ),
      ];

      emit(
        state.copyWith(
          getProductListStatus: GetProductListStatus.success,
          productListData: mockDataListPage,
        ),
      );
    } on DioException catch (e) {
      _logger.error("getProductList error: {}", [e.message]);
      _logger.error("type: {}", [e.type]);
      _logger.error("code: {}", [e.response?.statusCode]);

      emit(
        state.copyWith(
          getProductListStatus: GetProductListStatus.failure,
          dioTypeGetProductList: e.type,
          dioCodeGetProductList: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("getProductList error: {}", [e]);
      emit(state.copyWith(getProductListStatus: GetProductListStatus.failure));
    }
  }
}
