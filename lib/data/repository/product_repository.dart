import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/models/response/product_list_dto_response.dart';

class ProductRepository {
  final AppLogger _appLogger = AppLogger.getLogger("ProductRepository");

  // Future<ProductListDtoResponse> getProductList() async {
  //   _appLogger.debug("getProductList");

  //   final response = await AppApiService.instance.request(endpoint, method)
  // }
}
