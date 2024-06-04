import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/create_scm_order/data/models/create_scm_order_request.dart';

class CreateScmOrderRepo {
  final ApiService _apiService;

  CreateScmOrderRepo(this._apiService);

  Future<ApiResult<void>> createScmOrder(
    CreateScmOrderRequest createScmOrderRequest,
  ) async {
    try {
      final response = await _apiService.createScmOrder(
        createScmOrderRequest,
        "Bearer ${getIt.get<LoginResponse>().token!}",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
