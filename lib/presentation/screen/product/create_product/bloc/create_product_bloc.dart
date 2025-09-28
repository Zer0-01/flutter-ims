import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final AppLogger _logger = AppLogger.getLogger("CreateProductBloc");
  late final ProductRepository _productRepository;

  CreateProductBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(const CreateProductState()) {
    on<OnPressedAddProductEvent>(_onPressedAddProductEvent);
  }

  Future<void> _onPressedAddProductEvent(
    OnPressedAddProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    _logger.debug("onPressedAddProduct");

    await _postProduct(emit);
  }

  Future<void> _postProduct(Emitter emit) async {
    _logger.debug("postProduct");

    try {
      emit(state.copyWith(postProductStatus: PostProductStatus.loading));

      await _productRepository.postProduct();
    } catch (e) {
      _logger.error("Error: $e");
      emit(
        state.copyWith(
          postProductStatus: PostProductStatus.failure,
          dioTypePostProduct: DioExceptionType.unknown,
          dioCodePostProduct: 0,
        ),
      );
    }
  }
}
