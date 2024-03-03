import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/GetAllDepartment.dart';

class GetAllDepartmentRepo {
  final ApiService _apiService;
  GetAllDepartmentRepo(this._apiService);

  Future<ApiResult<GetAllDepartmentResponse>> getAllDepartment(
      String bearerToken,
      ) async {
    try {
      var response = await _apiService.getAllDepartment('Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}