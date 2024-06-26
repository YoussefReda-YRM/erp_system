import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';

class CategoryRepo {
  final ApiService _apiService;

  CategoryRepo(this._apiService);

  Future<ApiResult<List<CategoryAllCategoryModel>>> getAllCategory() async {
    try {
      var response = await _apiService.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

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

  Future<ApiResult<ResponseDeleteCategory>> deleteSubcategory(
      int subCategoryId) async {
    try {
      final response = await _apiService.deleteSubcategory(
        subCategoryId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
