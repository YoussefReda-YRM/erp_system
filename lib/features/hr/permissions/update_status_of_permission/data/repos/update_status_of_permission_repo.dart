import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionResponse.dart';

class UpdateStatusOfPermissionRepo {
  final ApiService _apiService;

  UpdateStatusOfPermissionRepo(this._apiService);

  Future<ApiResult<UpdateStatusOfPermissionResponse>> updateStatusOfPermission(
      String token,
      String permissionId,
      UpdateStatusOfPermissionRequest updateStatusOfPermissionRequest,
      ) async {
    try {
      final response = await _apiService.updateStatusOfPermission
        ("Bearer $token", permissionId, updateStatusOfPermissionRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
