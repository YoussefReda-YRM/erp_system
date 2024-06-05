import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/re_order_request.dart';

class ReOrderRepo {
  final ApiService _apiService;

  ReOrderRepo(this._apiService);

  Future<ApiResult<void>> reOrder(ReorderRequest reorderRequest) async {
    try {
      final response = await _apiService.reOrder(
        reorderRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
