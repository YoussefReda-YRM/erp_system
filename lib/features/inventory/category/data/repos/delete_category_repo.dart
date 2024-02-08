import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';

class DeleteCategoryRepo{

  final ApiService _apiService;

  DeleteCategoryRepo(this._apiService);



  Future<ApiResult<void>> deleteSubcategory(String bearerToken,int subCategoryId) async {
    try {
        await _apiService.deleteSubcategory('Bearer $bearerToken',subCategoryId);

      return ApiResult.success(true); // Since there's no specific response body for deletion
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}