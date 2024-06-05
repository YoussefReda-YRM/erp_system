import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/data/models/GetAllTaxesModel.dart';

class GetAllTaxesRepo {
  final ApiService _apiService;
  GetAllTaxesRepo(this._apiService);

  Future<ApiResult<List<GetAllTaxesModel>>> getAllTaxes() async {
    try {
      var response = await _apiService.getAllTaxes();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
