import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/request/register_dto_request.dart';
import 'package:flutter_ims/data/models/response/register_dto_response.dart';

class UserRepository {
  final _logger = AppLogger.getLogger("UserRepository");

  Future<RegisterDtoResponse> postRegister({
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    _logger.debug("postRegister");

    final response = await AppApiService.instance.request(
      ApiEndpoints.register,
      DioMethod.post,
      param: registerDtoRequest.toJson(),
    );

    return RegisterDtoResponse.fromJson(response.data);
  }
}
