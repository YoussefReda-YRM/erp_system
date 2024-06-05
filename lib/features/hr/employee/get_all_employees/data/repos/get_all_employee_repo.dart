import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';

class GetAllEmployeeRepo {
  final ApiService _apiService;
  GetAllEmployeeRepo(this._apiService);

  Future<ApiResult<GetAllEmployeeResponse>> getAllEmployees() async {
    try {
      var response = await _apiService.getAllEmployees();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteEmployee(String? employeeId) async {
    try {
      final respone = await _apiService.deleteEmployee(
        employeeId!,
      );

      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
