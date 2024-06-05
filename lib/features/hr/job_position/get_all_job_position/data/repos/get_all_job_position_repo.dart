import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';

class GetAllJobPositionRepo {
  final ApiService _apiService;
  GetAllJobPositionRepo(this._apiService);

  Future<ApiResult<List<GetAllJobPositionResponse>>> getAllJobPosition(
      int depId) async {
    try {
      var response = await _apiService.getAllJobPosition(depId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
