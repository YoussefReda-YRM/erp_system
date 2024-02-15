import 'dart:developer';

import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';

class AddProductRepo {
  final ApiService _apiService;

  AddProductRepo(this._apiService);

  Future<ApiResult<AddProductResponse>> addProduct(
      AddProductRequestBody addProductRequestBody) async {
    try {
      log("token to add product is : ${getIt.get<LoginResponse>().token.toString()}");
      final response = await _apiService.addProduct(
        addProductRequestBody,
        "Bearer ${getIt.get<LoginResponse>().token!}",
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
