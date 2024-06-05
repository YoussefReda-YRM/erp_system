import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';

class GetPermissionOfSpecificEmployeeRepo {
  final ApiService _apiService;
  GetPermissionOfSpecificEmployeeRepo(this._apiService);

  Future<ApiResult<List<GetPermissionOfSpecificEmployeeResponse>>>
      getPermissionsOfSpecificEmployee() async {
    try {
      var response = await _apiService.getAllPermissionOfSpecificEmployee();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
