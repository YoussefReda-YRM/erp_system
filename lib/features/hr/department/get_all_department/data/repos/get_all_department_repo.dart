import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';

class GetAllDepartmentRepo {
  final ApiService _apiService;
  GetAllDepartmentRepo(this._apiService);

  Future<ApiResult<List<GetAllDepartmentResponse>>> getAllDepartment() async {
    try {
      var response = await _apiService
          .getAllDepartment();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
