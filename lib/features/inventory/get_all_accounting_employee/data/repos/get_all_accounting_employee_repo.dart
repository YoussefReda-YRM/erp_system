import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/data/models/get_all_accounting_employee.dart';

class GetAllAccountingEmployeeRepo {
  final ApiService _apiService;

  GetAllAccountingEmployeeRepo(this._apiService);

  Future<ApiResult<List<GetAllAccountingEmployeeModel>>>
      getAllAccountingEmployee() async {
    try {
      var response = await _apiService.getAllAccountingEmployee();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
