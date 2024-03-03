import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';

class GetAllEmployeeRepo {
  final ApiService _apiService;
  GetAllEmployeeRepo(this._apiService);

  Future<ApiResult<GetAllEmployeeResponse>> getAllEmployees() async {
    try {
      var response = await _apiService.getAllEmployees(
        'Bearer ${getIt.get<LoginResponse>().token!}',
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
