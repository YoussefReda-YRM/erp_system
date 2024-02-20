import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_parent_category.dart';

class UpdateParentCategoryRepo {
  final ApiService _apiService;

  UpdateParentCategoryRepo(this._apiService);

  Future<ApiResult<ResponseParentCategory>> updateParentcategory(
    String token,
    int parentCategoryId,
    UpdateRequestParentCategory requestParentCategory,
  ) async {
    try {
      final response = await _apiService.updateParentcategory(
        "Bearer $token",
        parentCategoryId,
        requestParentCategory,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
