import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_request_body.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_response.dart';

class UpdateProductRepo {
  final ApiService _apiService;

  UpdateProductRepo(this._apiService);

  Future<ApiResult<UpdateProductResponse>> updateProduct(
    UpdateProductRequestBody updateProductRequestBody,
    int produtcId,
  ) async {
    try {
      final response = await _apiService.updateProduct(
        produtcId,
        updateProductRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
