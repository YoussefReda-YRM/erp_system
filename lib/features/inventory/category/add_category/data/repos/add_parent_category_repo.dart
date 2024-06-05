import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';

class AddParentCategoryRepo {
  final ApiService _apiService;

  AddParentCategoryRepo(this._apiService);

  Future<ApiResult<ResponseParentCategory>> addparentcategory(
    AddRequestParentCategory addRequestParentCategory,
  ) async {
    try {
      final response = await _apiService.createparent(
        addRequestParentCategory,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
