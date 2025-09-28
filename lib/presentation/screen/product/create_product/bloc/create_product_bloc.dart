import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/request/create_product_dto_request.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';
import 'package:flutter_ims/data/repository/category_repository.dart';
import 'package:flutter_ims/data/repository/product_repository.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final AppLogger _logger = AppLogger.getLogger("CreateProductBloc");
  late final ProductRepository _productRepository;
  late final CategoryRepository _categoryRepository;

  CreateProductBloc({
    required ProductRepository productRepository,
    required CategoryRepository categoryRepository,
  }) : _productRepository = productRepository,
       _categoryRepository = categoryRepository,
       super(const CreateProductState()) {
    on<OnPressedAddProductEvent>(_onPressedAddProductEvent);
    on<OnPressedCategoryEvent>(_onPressedCategoryEvent);
  }

  Future<void> _onPressedAddProductEvent(
    OnPressedAddProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    _logger.debug("onPressedAddProduct");
    final String name = event.name;
    final String sku = event.sku;
    final String category = event.category;
    final String costPrice = event.costPrice;
    final String sellingPrice = event.sellingPrice;
    final List<CategoriesData> categories = event.categories;
    final String description = event.description;
    final String unit = event.unit;

    final int categoryId =
        categories.where((cat) => category == cat.name).first.id;
    final double formattedCostPrice = double.parse(costPrice);
    final double formattedSellingPrice = double.parse(sellingPrice);

    _logger.debug("name: $name");
    _logger.debug("sku: $sku");
    _logger.debug("category: $category");
    _logger.debug("costPrice: $costPrice");
    _logger.debug("sellingPrice: $sellingPrice");
    _logger.debug("categoryId: $categoryId");
    _logger.debug("formattedCostPrice: $formattedCostPrice");
    _logger.debug("formattedSellingPrice: $formattedSellingPrice");
    _logger.debug("description: $description");
    _logger.debug("unit: $unit");

    final CreateProductDtoRequest createProductDtoRequest =
        CreateProductDtoRequest(
          name: name,
          sku: sku,
          categoryId: categoryId,
          costPrice: formattedCostPrice,
          sellingPrice: formattedSellingPrice,
          description: description,
          unit: unit,
        );

    await _postProduct(emit, createProductDtoRequest: createProductDtoRequest);
  }

  Future<void> _onPressedCategoryEvent(
    OnPressedCategoryEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    _logger.debug("onPressedCategory");

    await _getCategories(emit);
  }

  Future<void> _postProduct(
    Emitter emit, {
    required CreateProductDtoRequest createProductDtoRequest,
  }) async {
    _logger.debug("postProduct");

    try {
      emit(state.copyWith(postProductStatus: PostProductStatus.loading));

      await _productRepository.postProduct(
        createProductDtoRequest: createProductDtoRequest,
      );
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

  Future<void> _getCategories(Emitter emit) async {
    _logger.debug("getCategories");
    try {
      emit(state.copyWith(getCategoriesStatus: GetCategoriesStatus.loading));

      final CategoriesDtoResponse categoriesDtoResponse =
          await _categoryRepository.getCategories();

      final List<CategoriesData> categories = categoriesDtoResponse.data;
      _logger.debug("categories: $categories");

      emit(
        state.copyWith(
          getCategoriesStatus: GetCategoriesStatus.success,
          categories: categories,
        ),
      );
    } on DioException catch (e) {
      _logger.error("DioException: ${e.response?.statusCode}");
      _logger.error("DioExceptionType: ${e.type}");
      emit(
        state.copyWith(
          getCategoriesStatus: GetCategoriesStatus.failure,
          dioTypeGetCategories: e.type,
          dioCodeGetCategories: e.response?.statusCode ?? 0,
        ),
      );
    } catch (e) {
      _logger.error("Error: $e");
      emit(
        state.copyWith(
          getCategoriesStatus: GetCategoriesStatus.failure,
          dioTypeGetCategories: DioExceptionType.unknown,
          dioCodeGetCategories: 0,
        ),
      );
    }
  }
}
