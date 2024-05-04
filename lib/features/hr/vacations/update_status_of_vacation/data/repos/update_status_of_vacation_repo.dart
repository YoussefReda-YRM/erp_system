import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/pdate_status_of_vacation_response.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/update_status_of_vacation_request.dart';

class UpdateStatusOfVacationRepo {
  final ApiService _apiService;

  UpdateStatusOfVacationRepo(this._apiService);

  Future<ApiResult<UpdateStatusOfVacationResponse>> updateStatusOfVacation(
    String token,
    String vacationId,
    UpdateStatusOfVacationRequest updateStatusOfVacationRequest,
  ) async {
    try {
      final response = await _apiService.updateStatusOfVacation(
        "Bearer $token",
        vacationId,
        updateStatusOfVacationRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
