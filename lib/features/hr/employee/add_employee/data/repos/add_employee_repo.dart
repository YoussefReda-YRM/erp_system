import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_body.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_response.dart';

class AddEmployeeRepo {
  final ApiService _apiService;

  AddEmployeeRepo(this._apiService);

  Future<ApiResult<AddEmployeeResponse>> addEmployee(
      AddEmployeeRequestBody addEmployeeRequestBody) async {
    try {
      final response = await _apiService.addEmployee(
        addEmployeeRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<GetAllDepartmentResponse>>> allDepartment() async {
    try {
      var response = await _apiService.getAllDepartment();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
