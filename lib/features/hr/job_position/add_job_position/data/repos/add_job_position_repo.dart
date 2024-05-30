import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionRequest.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionResponse.dart';

class AddJobPositionRepo {
  final ApiService _apiService;
  AddJobPositionRepo(this._apiService);

  Future<ApiResult<AddJobPositionResponse>>  addJobPosition( AddJobPositionRequest addJobPositionRequest, String bearerToken,)
  async {
    try {
      var response = await _apiService.addJobPosition(addJobPositionRequest, 'Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}