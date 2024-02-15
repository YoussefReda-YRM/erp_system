import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/inventory_home/data/models/inventory_home_model.dart';

class InventoryHomeRepo {
  final ApiService _apiService;
  InventoryHomeRepo(this._apiService);

  Future<ApiResult<InventoryHomeModel>> getNumberOfProductsAndReplenishment(
    String bearerToken,
  ) async {
    try {
      final response = await _apiService.getNumberOfProductsAndReplenishment(
        "Bearer $bearerToken",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
