import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_request.dart';
import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_response.dart';

class RegisterPaymentRepo {
  final ApiService _apiService;
  RegisterPaymentRepo(this._apiService);

  Future<ApiResult<RegisterPaymentResponse>> registerPayment(
    RegisterPaymentRequest registerPaymentRequest,
  ) async {
    try {
      var response = await _apiService.registerPayment(
        registerPaymentRequest,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
