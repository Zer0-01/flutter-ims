import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/response/categories_dto_response.dart';

class CategoryRepository {
  final AppLogger _logger = AppLogger.getLogger("CategoryRepository");

  Future<CategoriesDtoResponse> getCategories() async {
    _logger.info("getCategories");
    final response = await AppApiService.instance.request(
      ApiEndpoints.categories,
      DioMethod.get,
    );

    return CategoriesDtoResponse.fromJson(response.data);
  }
}
