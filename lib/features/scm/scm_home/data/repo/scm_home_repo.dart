import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/scm_home/data/models/scm_home_model.dart';

class ScmHomeRepo {
  final ApiService _apiService;
  ScmHomeRepo(this._apiService);

  Future<ApiResult<ScmHomeModel>> getNumberOfInventoryAndScmOrdersCount(
    String bearerToken,
  ) async {
    try {
      final response = await _apiService.getNumberOfInventoryAndScmOrdersCount(
        "Bearer $bearerToken",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
