import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/request/register_dto_request.dart';

class UserRepository {
  final _logger = AppLogger.getLogger("UserRepository");

  Future<void> postRegister({
    required RegisterDtoRequest registerDtoRequest,
  }) async {
    _logger.debug("postRegister");
    _logger.debug("registerDtoRequest: ${registerDtoRequest.toJson()}");

    await AppApiService.instance.request(
      ApiEndpoints.registerOrganization,
      DioMethod.post,
      param: registerDtoRequest.toJson(),
    );
  }
}
