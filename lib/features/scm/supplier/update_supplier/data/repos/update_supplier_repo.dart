import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierResponse.dart';

class UpdateSupplierRepo {
  final ApiService _apiService;

  UpdateSupplierRepo(this._apiService);

  Future<ApiResult<UpdateSupplierResponse>> updateSupplier(
    int supplierId,
    UpdateSupplierRequest updateSupplierRequest,
  ) async {
    try {
      final response =
          await _apiService.updateSupplier(supplierId, updateSupplierRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
