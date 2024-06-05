import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';

class DetailsProductRepo {
  final ApiService _apiService;
  DetailsProductRepo(this._apiService);

  Future<ApiResult<DetailsProductModel>> getProductById(
    int idProduct,
  ) async {
    try {
      final response = await _apiService.getProductById(
        idProduct,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
