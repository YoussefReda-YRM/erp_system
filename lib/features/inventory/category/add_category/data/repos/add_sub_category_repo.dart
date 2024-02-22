import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_sub_category.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';

class AddSubCategoryRepo {
  final ApiService _apiService;

  AddSubCategoryRepo(this._apiService);

  Future<ApiResult<ResponseSubCategory>> addsubcategory(
      AddRequestSubCategoey requestsubCategory, String token) async {
    try {
      //  log("token to add product is : ${getIt.get<LoginResponse>().token.toString()}");
      final response = await _apiService.createsub(
        requestsubCategory,
        "Bearer $token",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
