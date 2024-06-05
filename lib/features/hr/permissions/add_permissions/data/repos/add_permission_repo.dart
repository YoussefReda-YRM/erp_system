import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionResponse.dart';

class AddPermissionRepo {
  final ApiService _apiService;
  AddPermissionRepo(this._apiService);

  Future<ApiResult<AddPermissionResponse>> addPermission(
    AddPermissionRequest addPermissionRequest,
  ) async {
    try {
      var response = await _apiService.addPermission(addPermissionRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
