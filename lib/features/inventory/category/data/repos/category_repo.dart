import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';

import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';

class CategoryRepo {
  final ApiService _apiService;

  CategoryRepo(this._apiService);

  Future<ApiResult<List<CategoryDm>>> getAllCategories() async {
    try {
      final response = await _apiService.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteSubcategory(int subCategoryId) async {
    try {
      await _apiService.deleteSubcategory(subCategoryId);
      return ApiResult.success(null); // Since there's no specific response body for deletion
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
