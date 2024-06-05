import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentResponse.dart';

class AddDepartmentRepo {
  final ApiService _apiService;
  AddDepartmentRepo(this._apiService);

  Future<ApiResult<AddDepartmentResponse>> addDepartment(
    AddDepartmentRequest addDepartmentRequest,
  ) async {
    try {
      print("tryyy");
      var response = await _apiService.addDepartment(
        addDepartmentRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      print("catchh");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
