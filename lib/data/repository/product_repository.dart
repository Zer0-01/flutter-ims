import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/request/create_product_dto_request.dart';
import 'package:flutter_ims/data/models/response/products_dto_response.dart';

class ProductRepository {
  final AppLogger _appLogger = AppLogger.getLogger("ProductRepository");

  Future<ProductsDtoResponse> getProducts() async {
    _appLogger.debug("getProductList");

    final response = await AppApiService.instance.request(
      ApiEndpoints.products,
      DioMethod.get,
    );

    return ProductsDtoResponse.fromJson(response.data);
  }

  Future<void> postProduct({
    required CreateProductDtoRequest createProductDtoRequest,
  }) async {
    _appLogger.debug("postProduct");

    await AppApiService.instance.request(
      ApiEndpoints.products,
      DioMethod.post,
      param: createProductDtoRequest.toJson(),
    );
  }
}
