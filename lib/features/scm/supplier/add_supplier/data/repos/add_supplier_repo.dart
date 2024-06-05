import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierResponse.dart';

class AddSupplierRepo {
  final ApiService _apiService;
  AddSupplierRepo(this._apiService);

  Future<ApiResult<AddSupplierResponse>> addSupplier(
    AddSupplierRequest addSupplierRequest,
  ) async {
    try {
      var response = await _apiService.addsupplier(
        addSupplierRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
