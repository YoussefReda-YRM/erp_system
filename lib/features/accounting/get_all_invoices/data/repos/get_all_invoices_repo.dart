import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';

class GetAllInvoicesRepo {
  final ApiService _apiService;
  GetAllInvoicesRepo(this._apiService);

  Future<ApiResult<List<GetAllInvoicesResponse>>> getAllInvoices() async {
    try {
      var response = await _apiService.getAllInvoices();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
