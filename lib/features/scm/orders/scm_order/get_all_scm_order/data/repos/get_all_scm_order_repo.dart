import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/data/models/GetAllScmOrdersModel.dart';

class GetAllScmOrderRepo {
  final ApiService _apiService;
  GetAllScmOrderRepo(this._apiService);

  Future<ApiResult<List<GetAllScmOrdersModel>>> getAllScmOrder(
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