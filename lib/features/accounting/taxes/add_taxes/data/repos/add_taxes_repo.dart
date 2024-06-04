import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesRequest.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesResponse.dart';

class AddTaxesRepo {
  final ApiService _apiService;
  AddTaxesRepo(this._apiService);

  Future<ApiResult<AddTaxesResponse>>  addTaxes( AddTaxesRequest addTaxesRequest, String bearerToken,)

  async {
    try {
      var response = await _apiService.addTaxes(addTaxesRequest, 'Bearer $bearerToken');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}