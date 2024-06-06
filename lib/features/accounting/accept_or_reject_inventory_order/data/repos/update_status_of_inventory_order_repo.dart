import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/accept_or_reject_inventory_order/data/models/update_status_of_inventory_order_request.dart';

class UpdateStatusOfInventoryOrderRepo {
  final ApiService _apiService;

  UpdateStatusOfInventoryOrderRepo(this._apiService);

  Future<ApiResult<void>> updateStatusOfInventoryOrder(
    String orderId,
    UpdateStatusOfInventoryOrderRequest updateStatusOfInventoryOrderRequest,
  ) async {
    try {
      final response = await _apiService.updateStatusOfInventoryOrder(
        orderId,
        updateStatusOfInventoryOrderRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
