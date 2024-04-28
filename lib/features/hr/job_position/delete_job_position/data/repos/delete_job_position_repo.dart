import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/data/models/DeleteJobPositionResponse.dart';

class DeleteJobPositionRepo {
  final ApiService _apiService;

  DeleteJobPositionRepo(this._apiService);

  Future<ApiResult<DeleteJobPositionResponse>> deleteJobPosition(
      String bearerToken, int jobPositionId) async {
    try {
      final response = await _apiService.deleteJobPosition( 'Bearer $bearerToken', jobPositionId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
