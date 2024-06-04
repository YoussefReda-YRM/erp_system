import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';

class GetAllProductRepo {
  final ApiService _apiService;
  GetAllProductRepo(this._apiService);

  Future<ApiResult<GetAllProductResponse>> getAllProduct() async {
    try {
      var response = await _apiService.getAllProducts(
        "Bearer ${getIt.get<LoginResponse>().token!}",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
