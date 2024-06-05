import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';

class AddProductRepo {
  final ApiService _apiService;

  AddProductRepo(this._apiService);

  Future<ApiResult<AddProductResponse>> addProduct(
      AddProductRequestBody addProductRequestBody) async {
    try {
      final response = await _apiService.addProduct(
        addProductRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
