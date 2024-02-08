import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';

class GetAllProductRepo {
  final ApiService _apiService;
  GetAllProductRepo(this._apiService);

  Future<ApiResult<GetAllProductResponse>> getAllProduct(String bearerToken) async {
    try {
      var response = await _apiService.getAllProducts('Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
