import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';

class DeleteSubCategoryRepo {
  final ApiService _apiService;

  DeleteSubCategoryRepo(this._apiService);

  Future<ApiResult<ResponseDeleteCategory>> deleteSubcategory(
      String bearerToken, int subCategoryId) async {
    try {
      final response = await _apiService.deleteSubcategory(
          subCategoryId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
