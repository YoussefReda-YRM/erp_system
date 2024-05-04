import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentResponse.dart';

class UpdateDepartmentRepo {
  final ApiService _apiService;

  UpdateDepartmentRepo(this._apiService);

  Future<ApiResult<UpdateDepartmentResponse>> updateDepartment(
      String token,
      int supplierId,
      UpdateDepartmentRequest updateDepartmentRequest,
      ) async {
    try {
      final response = await _apiService.updateDepartment("Bearer $token", supplierId, updateDepartmentRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
