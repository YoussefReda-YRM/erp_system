import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/data/models/GetAllPermissionResponse.dart';

class GetAllPermissionRepo {
  final ApiService _apiService;
  GetAllPermissionRepo(this._apiService);

  Future<ApiResult<List<GetAllPermissionResponse>>> getAllPermissions() async {
    try {
      var response = await _apiService.getAllPermission('Bearer ${getIt.get<LoginResponse>().token!}')
         ;
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
