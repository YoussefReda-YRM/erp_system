import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/employee/update_employee/data/models/update_employee_request.dart';

class UpdateEmployeeRepo {
  final ApiService _apiService;

  UpdateEmployeeRepo(this._apiService);

  Future<ApiResult<void>> updateEmployee(
    String employeeId,
    UpdateEmployeeRequest updateEmployeeRequest
  ) async {
    try {
      final response = await _apiService.updateEmployee(
        "Bearer ${getIt.get<LoginResponse>().token!}",
        employeeId,
        updateEmployeeRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
