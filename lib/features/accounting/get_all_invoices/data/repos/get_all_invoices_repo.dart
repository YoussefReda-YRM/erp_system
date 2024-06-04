import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';

class GetAllInvoicesRepo {
  final ApiService _apiService;
  GetAllInvoicesRepo(this._apiService);

  Future<ApiResult<List<GetAllInvoicesResponse>>> getAllInvoices() async {
    try {
      var response = await _apiService.getAllInvoices(
        'Bearer ${getIt.get<LoginResponse>().token!}',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
