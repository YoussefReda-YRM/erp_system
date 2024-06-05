import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';

class GetAllInvoicesOfSupplierRepo {
  final ApiService _apiService;
  GetAllInvoicesOfSupplierRepo(this._apiService);

  Future<ApiResult<List<GetAllInvoicesOfSupplierResponse>>>
      getAllInvoicesOfSupplier(int supplierId) async {
    try {
      var response = await _apiService.getAllInvoicesOfSupplier(
        supplierId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
