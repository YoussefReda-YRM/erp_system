import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';

class GetAllSupplierRepo {
  final ApiService _apiService;
  GetAllSupplierRepo(this._apiService);

  Future<ApiResult<GetAllSupplierResponse>> getAllSupplier() async {
    try {
      var response = await _apiService.getAllSuppliers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
