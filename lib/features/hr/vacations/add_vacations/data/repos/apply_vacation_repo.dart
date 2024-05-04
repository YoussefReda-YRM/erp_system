import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_request.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_response.dart';

class ApplyVacationRepo {
  final ApiService _apiService;

  ApplyVacationRepo(this._apiService);

  Future<ApiResult<ApplyVacationResponse>> applyVacation(
      ApplyVacationRequest applyVacationRequest) async {
    try {
      final response = await _apiService.applyVacation(
        applyVacationRequest,
        "Bearer ${getIt.get<LoginResponse>().token!}",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }   
}
