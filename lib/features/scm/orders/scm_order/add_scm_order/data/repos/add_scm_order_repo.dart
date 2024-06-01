import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/data/models/AddScmOrderRequest.dart';
import 'package:erp_system/features/scm/orders/scm_order/add_scm_order/data/models/AddScmOrderResponse.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierResponse.dart';

class AddScmOrderRepo {
  final ApiService _apiService;
  AddScmOrderRepo(this._apiService);

  Future<ApiResult<AddScmOrderResponse>> addScmOrder( AddScmOrderModel addScmOrderModel,
      String bearerToken,
      ) async {
    try {
      var response = await _apiService.addScmOrder(addScmOrderModel, 'Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}