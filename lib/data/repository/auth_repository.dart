import 'package:flutter_ims/configuration/app_api_service.dart';
import 'package:flutter_ims/configuration/app_logger.dart';
import 'package:flutter_ims/data/api_endpoints.dart';
import 'package:flutter_ims/data/models/request/login_dto_request.dart';
import 'package:flutter_ims/data/models/request/register_dto_request.dart';
import 'package:flutter_ims/data/models/response/login_dto_response.dart';
import 'package:flutter_ims/data/models/response/me_dto_response.dart';

class AuthRepository {
  final AppLogger _logger = AppLogger.getLogger("AuthRepository");

  Future<MeDtoResponse> getMe() async {
    _logger.debug("getMe");
    final response = await AppApiService.instance.request(
      ApiEndpoints.me,
      DioMethod.get,
    );

    return MeDtoResponse.fromJson(response.data);
  }

  Future<LoginDtoResponse> postLogin({
    required LoginDtoRequest loginDtoRequest,
  }) async {
    _logger.debug("postLogin");

    final response = await AppApiService.instance.request(
      ApiEndpoints.login,
      DioMethod.post,
      param: loginDtoRequest.toJson(),
    );

    return LoginDtoResponse.fromJson(response.data);
  }

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
