import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/models/get_all_scm_orders_response.dart';

class GetAllScmOrdersRepo {
  final ApiService _apiService;
  GetAllScmOrdersRepo(this._apiService);

  Future<ApiResult<List<GetAllScmOrdersResponse>>> getAllScmOrders(
    String bearerToken,
  ) async {
    try {
      var response = await _apiService.getAllScmOrders('Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
