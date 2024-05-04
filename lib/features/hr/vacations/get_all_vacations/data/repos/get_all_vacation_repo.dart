import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';

class GetAllVacationRepo {
  final ApiService _apiService;
  GetAllVacationRepo(this._apiService);

  Future<ApiResult<List<GetAllVacationModel>>> getAllVacations() async {
    try {
      var response = await _apiService
          .getAllVacations('Bearer ${getIt.get<LoginResponse>().token!}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
