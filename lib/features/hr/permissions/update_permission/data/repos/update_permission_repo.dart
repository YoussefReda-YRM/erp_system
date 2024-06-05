import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionResponse.dart';

class UpdatePermissionRepo {
  final ApiService _apiService;

  UpdatePermissionRepo(this._apiService);

  Future<ApiResult<UpdatePermissionResponse>> updatePermission(
    int permissionId,
    UpdatePermissionRequest updatePermissionRequest,
  ) async {
    try {
      final response = await _apiService.updatePermission(
          permissionId, updatePermissionRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
