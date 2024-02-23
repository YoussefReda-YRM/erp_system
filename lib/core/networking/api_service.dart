import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_constants.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:erp_system/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_sub_category.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_sub_category.dart';
import 'package:erp_system/features/inventory/inventory_home/data/models/inventory_home_model.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
import 'package:erp_system/features/scm/inventory_order/data/models/get_all_inventory_orders_model.dart';
import 'package:erp_system/features/scm/order_details/data/models/order_details_model.dart';
import 'package:erp_system/features/scm/scm_home/data/models/scm_home_model.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
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

  @POST(ApiConstants.createParent)
  Future<ResponseParentCategory> createparent(
    @Body() AddRequestParentCategory addRequestParentCategory,
    @Header("Authorization") String token,
  );

  @POST(ApiConstants.createsub)
  Future<ResponseSubCategory> createsub(
    @Body() AddRequestSubCategoey requestSubCategory,
    @Header("Authorization") String token,
  );

  @PUT(ApiConstants.updateSubcategory)
  Future<ResponseSubCategory> updateSubcategory(
    @Header("Authorization") String token,
    @Path("subCategoryId") int subCategoryId,
    @Body() UpdateRequestSubCategory requestSubCategory,
  );

  @PUT(ApiConstants.updateParentcategory)
  Future<ResponseParentCategory> updateParentcategory(
    @Header("Authorization") String token,
    @Path("parentCategoryId") int parentCategoryId,
    @Body() UpdateRequestParentCategory requestParentCategory,
  );

  @DELETE(ApiConstants.deleteSubcategory)
  Future<ResponseDeleteCategory> deleteSubcategory(
    @Header("Authorization") String token,
    @Path("subCategoryId") int subCategoryId,
  );

  @DELETE(ApiConstants.deleteParentcategory)
  Future<ResponseDeleteCategory> deleteParentcategory(
    @Header("Authorization") String token,
    @Path("parentCategoryId") int parentCategoryId,
  );

  @GET(ApiConstants.getAllCategories)
  Future<List<CategoryAllCategoryModel>> getAllCategories(
    @Header("Authorization") String token,
  );

  //Supplier
  @GET(ApiConstants.getAllSuppliers)
  Future<GetAllSupplierResponse> getAllSuppliers(
    @Header("Authorization") String token,
  );

//Orders
  @GET(ApiConstants.getNumberofInventoryAndScmOrder)
  Future<ScmHomeModel> getNumberOfInventoryAndScmOrdersCount(
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.getAllInventoryOrder)
  Future<GetAllInventoryOrderModel> getAllInventoryOrders(
    @Header("Authorization") String token,
  );


  @GET("${ApiConstants.getSpecificInventoryOrder}/{id}")
  Future<OrderDetailsModel> getSpecificInventoryOrder(
    @Header("Authorization") String token,
    @Path("id") int id,
  );
}
