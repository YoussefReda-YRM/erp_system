import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionResponse.dart';

class AddPermissionRepo {
  final ApiService _apiService;
  AddPermissionRepo(this._apiService);

  Future<ApiResult<AddPermissionResponse>> addPermission( AddPermissionRequest addPermissionRequest,
      String bearerToken,
      ) async {
    try {
      print("tryyy");
      var response = await _apiService.addPermission(addPermissionRequest,  'Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      print("catchh");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}