import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/networking/api_error_handler.dart';
import 'package:erp_system/core/networking/api_result.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/data/models/get_all_scm_order_status_Response.dart';

class GetAllScmOrderStatusRepo {
  final ApiService _apiService;
  GetAllScmOrderStatusRepo(this._apiService);

  Future<ApiResult<List<GetAllScmOrderStatusResponse>>>
      getAllScmOrderStatus() async {
    try {
      var response = await _apiService
          .getAllScmOrderStatus('Bearer ${getIt.get<LoginResponse>().token!}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
