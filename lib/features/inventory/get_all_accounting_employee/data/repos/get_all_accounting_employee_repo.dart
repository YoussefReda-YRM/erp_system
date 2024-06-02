import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/data/models/get_all_accounting_employee.dart';

class GetAllAccountingEmployeeRepo {
  final ApiService _apiService;

  GetAllAccountingEmployeeRepo(this._apiService);

  Future<ApiResult<List<GetAllAccountingEmployeeModel>>>
      getAllAccountingEmployee() async {
    try {
      var response = await _apiService.getAllAccountingEmployee(
        'Bearer ${getIt.get<LoginResponse>().token!}',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
