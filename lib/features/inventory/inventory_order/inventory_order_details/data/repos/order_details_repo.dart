import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/models/order_details_model.dart';

class OrderDetailsRepo {
  final ApiService _apiService;
  OrderDetailsRepo(this._apiService);

  Future<ApiResult<OrderDetailsModel>> getSpecificInventoryOrder(
    int orderId,
  ) async {
    try {
      var response = await _apiService.getSpecificInventoryOrder(
        orderId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
