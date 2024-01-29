import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_constants.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  @GET(ApiConstants.getcategory)
  Future<List<CategoryDm>> getAllCategories();

  @DELETE(ApiConstants.deleteSubcategory)
  Future<void> deleteSubcategory(@Path('subCategoryId') int subCategoryId);


}
