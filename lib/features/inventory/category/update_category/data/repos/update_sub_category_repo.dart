import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_sub_category.dart';

class UpdateSubCategoryRepo {
  final ApiService _apiService;

  UpdateSubCategoryRepo(this._apiService);

  Future<ApiResult<ResponseSubCategory>> updatesubcategory(
    int subCategoryId,
    UpdateRequestSubCategory requestSubCategory,
  ) async {
    try {
      final response = await _apiService.updateSubcategory(
        subCategoryId,
        requestSubCategory,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
