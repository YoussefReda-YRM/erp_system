import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/orders/inventory_order/data/models/get_all_inventory_orders_model.dart';

class GetAllInventoryOrdersRepo {
  final ApiService _apiService;
  GetAllInventoryOrdersRepo(this._apiService);

  Future<ApiResult<GetAllInventoryOrderModel>> getAllInventoryOrders(
    String bearerToken,
  ) async {
    try {
      var response = await _apiService.getAllInventoryOrders('Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
