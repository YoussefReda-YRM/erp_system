import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/vacations/delete_vacation/data/models/DeleteVacationResponse.dart';

class DeleteVacationRepo {
  final ApiService _apiService;
  DeleteVacationRepo(this._apiService);

  Future<ApiResult<DeleteVacationResponse>> deleteVacation(
      String vacationId) async {
    try {
      final respone = await _apiService.deleteVacation('Bearer ${getIt.get<LoginResponse>().token}', vacationId)

      ;

      return ApiResult.success(respone);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
