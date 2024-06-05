import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';

class GetAllVacationRepo {
  final ApiService _apiService;
  GetAllVacationRepo(this._apiService);

  Future<ApiResult<List<GetAllVacationModel>>> getAllVacations() async {
    try {
      var response = await _apiService
          .getAllVacations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
