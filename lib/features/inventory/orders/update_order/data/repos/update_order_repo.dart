import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/orders/update_order/data/models/update_order_request.dart';
import 'package:erp_system/features/inventory/orders/update_order/data/models/update_order_response.dart';

class UpdateOrderRepo {
  final ApiService _apiService;

  UpdateOrderRepo(this._apiService);

  Future<ApiResult<UpdateOrderResponse>> updateOrder(
    String token,
    int orderId,
    UpdateOrderRequest updateOrderRequest,
  ) async {
    try {
      final response = await _apiService.updateOrder(
        "Bearer $token",
        orderId,
        updateOrderRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
