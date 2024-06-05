import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/get_all_roles_model.dart';

class GetAllRolesRepo {
  final ApiService _apiService;

  GetAllRolesRepo(this._apiService);

  Future<ApiResult<List<GetAllRolesResponse>>> getAllRoles() async {
    try {
      var response = await _apiService.getAllRoles();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
