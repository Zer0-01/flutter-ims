import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/request/create_category_dto_request.dart';
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

  Future<void> postCategory({
    required CreateCategoryDtoRequest createCategoryDtoRequest,
  }) async {
    _logger.info("postCategory");
    final Map<String, dynamic> param = createCategoryDtoRequest.toJson();
    await AppApiService.instance.request(
      ApiEndpoints.categories,
      DioMethod.post,
      param: param,
    );
  }
}
