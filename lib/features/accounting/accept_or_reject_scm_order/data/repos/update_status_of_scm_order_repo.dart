import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/accept_or_reject_scm_order/data/models/update_status_of_scm_order_request.dart';

class UpdateStatusOfScmOrderRepo {
  final ApiService _apiService;

  UpdateStatusOfScmOrderRepo(this._apiService);

  Future<ApiResult<void>> updateStatusOfScmOrder(
    String orderId,
    UpdateStatusOfScmOrderRequest updateStatusOfScmOrderRequest,
  ) async {
    try {
      final response = await _apiService.updateStatusOfScmOrder(
        orderId,
        updateStatusOfScmOrderRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
