import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';

class DeleteDepartmentRepo {
  final ApiService _apiService;
  DeleteDepartmentRepo(this._apiService);

  Future<ApiResult<ResponseDeleteCategory>> deleteDepartment(
       int depId) async {
    try {
      final respone = await _apiService.deleteDepartment(
          'Bearer ${getIt.get<LoginResponse>().token}',
          depId
      );

      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
