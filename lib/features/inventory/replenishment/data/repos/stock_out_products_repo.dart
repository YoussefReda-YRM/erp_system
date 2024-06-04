import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';

class StockOutProductsRepo {
  final ApiService _apiService;
  StockOutProductsRepo(this._apiService);

  Future<ApiResult<List<StockOutProductsResponse>>> stockoutProducts() async {
    try {
      var response = await _apiService
          .stockOutProducts("Bearer ${getIt.get<LoginResponse>().token!}");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
