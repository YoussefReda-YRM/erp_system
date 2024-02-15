import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_constants.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:erp_system/features/inventory/inventory_home/data/models/inventory_home_model.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
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

  @GET(ApiConstants.getNumberOfProductsAndReplenishment)
  Future<InventoryHomeModel> getNumberOfProductsAndReplenishment(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.getAllProducts)
  Future<GetAllProductResponse> getAllProducts(
    @Header("Authorization") String token,
  );

  @POST(ApiConstants.addProduct)
  Future<AddProductResponse> addProduct(
      @Body() AddProductRequestBody addProductRequestBody,
      @Header("Authorization") String token);

  @GET("${ApiConstants.getProductById}/{id}")
  Future<DetailsProductModel> getProductById(
    @Header("Authorization") String token,
    @Path("id") int id,
  );
}
