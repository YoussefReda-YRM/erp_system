import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';

class StockOutProductsRepo {
  final ApiService _apiService;
  StockOutProductsRepo(this._apiService);

  Future<ApiResult<List<StockOutProductsResponse>>> stockoutProducts() async {
    try {
      var response = await _apiService.stockOutProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
