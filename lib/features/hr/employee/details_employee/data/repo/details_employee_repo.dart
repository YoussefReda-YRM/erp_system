import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/employee/details_employee/data/models/details_employee_model.dart';

class DetailsEmployeeRepo {
  final ApiService _apiService;
  DetailsEmployeeRepo(this._apiService);

  Future<ApiResult<DetailsEmployeeModel>> getSpecificEmployee(
    String employeeId,
  ) async {
    try {
      final response = await _apiService.getSpecificEmployee(
        employeeId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
