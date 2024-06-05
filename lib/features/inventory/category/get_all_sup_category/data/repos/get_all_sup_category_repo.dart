import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/data/models/get_all_sup_category_model.dart';

class GetAllSupCategoryRepo {
  final ApiService _apiService;

  GetAllSupCategoryRepo(this._apiService);

  Future<ApiResult<List<GetAllSupCategoryModel>>> getAllSupCategory() async {
    try {
      var response = await _apiService.getAllSupCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
