import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/data/models/DeletePermissionResponse.dart';

class DeletePermissionRepo {
  final ApiService _apiService;
  DeletePermissionRepo(this._apiService);

  Future<ApiResult<DeletePermissionResponse>> deletePermission(
      String permissionId) async {
    try {
      final respone = await _apiService.deletePermission('Bearer ${getIt.get<LoginResponse>().token}', permissionId)
      ;

      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
