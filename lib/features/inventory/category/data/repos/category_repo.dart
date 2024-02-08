import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';

import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
class CategoryRepo {
  final ApiService _apiService;

  CategoryRepo(this._apiService);

  Future<ApiResult<List<CategoryDm>>> getAllCategory(String bearerToken) async {
    try {
      var response = await _apiService.getAllCategories('Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      print("ommmm kda ${error}");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



}






