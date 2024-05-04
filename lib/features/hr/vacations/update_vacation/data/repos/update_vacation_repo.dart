import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationRequest.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationResponse.dart';

class UpdateVacationRepo {
  final ApiService _apiService;

  UpdateVacationRepo(this._apiService);

  Future<ApiResult<UpdateVacationResponse>> updateVacation(
      String token,
      int vacationId,
      UpdateVacationRequest updateVacationRequest,
      ) async {
    try {
      final response = await _apiService.updateVacation("Bearer $token", vacationId, updateVacationRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
