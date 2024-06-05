import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/UpdateJobRequest.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/update_job_response.dart';

class UpdateJobPositionRepo {
  final ApiService _apiService;

  UpdateJobPositionRepo(this._apiService);

  Future<ApiResult<UpdateJobResponse>> updateJobPosition(
    int jobPositionId,
    UpdateJobRequest updateJobRequest,
  ) async {
    try {
      final response =
          await _apiService.updateJobPosition(jobPositionId, updateJobRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
