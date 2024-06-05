import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';

class DeleteParentCategoryRepo {
  final ApiService _apiService;
  DeleteParentCategoryRepo(this._apiService);

  Future<ApiResult<ResponseDeleteCategory>> deleteParentCategory(
      int parentCategoryId) async {
    try {
      final respone = await _apiService.deleteParentcategory(
        parentCategoryId,
      );

      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
