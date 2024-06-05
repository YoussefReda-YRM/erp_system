import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_constants.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/data/models/get_all_scm_orders_response.dart';
import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_request.dart';
import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_response.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesRequest.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/data/models/AddTaxesResponse.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/data/models/GetAllTaxesModel.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/hr/attendance/data/models/attendance_response.dart';
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/add_department/data/models/AddDepartmentResponse.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentRequest.dart';
import 'package:erp_system/features/hr/department/update_department/data/models/UpdateDepartmentResponse.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_body.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/add_employee_response.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/get_all_roles_model.dart';
import 'package:erp_system/features/hr/employee/details_employee/data/models/details_employee_model.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';
import 'package:erp_system/features/hr/employee/update_employee/data/models/update_employee_request.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/models/AddPermissionResponse.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/data/models/DeletePermissionResponse.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionResponse.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/models/UpdateStatusOfPermissionResponse.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_request.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/models/apply_vacation_response.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionRequest.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/model/AddJobPositionResponse.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/data/models/DeleteJobPositionResponse.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/UpdateJobRequest.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/update_job_response.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/data/models/GetAllPermissionResponse.dart';
import 'package:erp_system/features/hr/vacations/delete_vacation/data/models/DeleteVacationResponse.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/pdate_status_of_vacation_response.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/data/models/update_status_of_vacation_request.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationRequest.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/models/UpdateVacationResponse.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/models/response_delete_category.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/add_category/data/models/add_request_sub_category.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/data/models/get_all_sup_category_model.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseParentCategory.dart';
import 'package:erp_system/features/inventory/category/repos/ResponseSubCategory.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_parent_category.dart';
import 'package:erp_system/features/inventory/category/update_category/data/models/update_request_sub_category.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/data/models/get_all_accounting_employee.dart';
import 'package:erp_system/features/inventory/inventory_home/data/models/inventory_home_model.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_response.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_request_body.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_response.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/re_order_request.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';
import 'package:erp_system/features/inventory/inventory_order/get_all_inventory_order/data/models/get_all_inventory_orders_model.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/models/order_details_model.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/data/models/update_order_request.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/data/models/update_order_response.dart';
import 'package:erp_system/features/scm/create_scm_order/data/models/create_scm_order_request.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/data/models/get_all_scm_order_status_Response.dart';
import 'package:erp_system/features/scm/scm_home/data/models/scm_home_model.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/models/AddSupplierResponse.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierRequest.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/models/UpdateSupplierResponse.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @GET(ApiConstants.getNumberOfProductsAndReplenishment)
  Future<InventoryHomeModel> getNumberOfProductsAndReplenishment();

  @GET(ApiConstants.getAllProducts)
  Future<GetAllProductResponse> getAllProducts();

  @POST(ApiConstants.addProduct)
  Future<AddProductResponse> addProduct(
    @Body() AddProductRequestBody addProductRequestBody,
  );

  @GET("${ApiConstants.getProductById}/{id}")
  Future<DetailsProductModel> getProductById(
    @Path("id") int id,
  );

  @GET(ApiConstants.stockOutProduct)
  Future<List<StockOutProductsResponse>> stockOutProducts();

  @POST(ApiConstants.reOrder)
  Future<void> reOrder(
    @Body() ReorderRequest reorderRequest,
  );

  @PUT(ApiConstants.updateProduct)
  Future<UpdateProductResponse> updateProduct(
    @Path("productId") int productId,
    @Body() UpdateProductRequestBody updateProductRequestBody,
  );

  @POST(ApiConstants.createParent)
  Future<ResponseParentCategory> createparent(
    @Body() AddRequestParentCategory addRequestParentCategory,
  );

  @POST(ApiConstants.createsub)
  Future<ResponseSubCategory> createsub(
    @Body() AddRequestSubCategoey requestSubCategory,
  );

  @PUT(ApiConstants.updateSubcategory)
  Future<ResponseSubCategory> updateSubcategory(
    @Path("subCategoryId") int subCategoryId,
    @Body() UpdateRequestSubCategory requestSubCategory,
  );

  @PUT(ApiConstants.updateParentcategory)
  Future<ResponseParentCategory> updateParentcategory(
    @Path("parentCategoryId") int parentCategoryId,
    @Body() UpdateRequestParentCategory requestParentCategory,
  );

  @DELETE(ApiConstants.deleteSubcategory)
  Future<ResponseDeleteCategory> deleteSubcategory(
    @Path("subCategoryId") int subCategoryId,
  );

  @DELETE(ApiConstants.deleteParentcategory)
  Future<ResponseDeleteCategory> deleteParentcategory(
    @Path("parentCategoryId") int parentCategoryId,
  );

  @GET(ApiConstants.getAllCategories)
  Future<List<CategoryAllCategoryModel>> getAllCategories();

  @GET(ApiConstants.getAllSupCategory)
  Future<List<GetAllSupCategoryModel>> getAllSupCategories();

  //Supplier
  @GET(ApiConstants.getAllSuppliers)
  Future<GetAllSupplierResponse> getAllSuppliers();

  @POST(ApiConstants.addSuppliers)
  Future<AddSupplierResponse> addsupplier(
    @Body() AddSupplierRequest addSupplierRequest,
  );

  @PUT(ApiConstants.updateSuppliers)
  Future<UpdateSupplierResponse> updateSupplier(
    @Path("id") int supplierId,
    @Body() UpdateSupplierRequest updateSupplierRequest,
  );

//Orders
  @GET(ApiConstants.getNumberofInventoryAndScmOrder)
  Future<ScmHomeModel> getNumberOfInventoryAndScmOrdersCount();

  @GET(ApiConstants.getAllInventoryOrder)
  Future<GetAllInventoryOrderModel> getAllInventoryOrders();

  @GET("${ApiConstants.getSpecificInventoryOrder}/{id}")
  Future<OrderDetailsModel> getSpecificInventoryOrder(
    @Path("id") int id,
  );

  @PUT(ApiConstants.updateOrder)
  Future<UpdateOrderResponse> updateOrder(
    @Path("orderId") int orderId,
    @Body() UpdateOrderRequest requestParentCategory,
  );

  @GET(ApiConstants.getAllScmOrders)
  Future<List<GetAllScmOrdersResponse>> getAllScmOrders();

  @GET(ApiConstants.scmOrderStatus)
  Future<List<GetAllScmOrderStatusResponse>> getAllScmOrderStatus();

  @POST(ApiConstants.createScmOrder)
  Future<void> createScmOrder(
    @Body() CreateScmOrderRequest createScmOrderRequest,
  );

  @GET(ApiConstants.getAllAccountingEmployee)
  Future<List<GetAllAccountingEmployeeModel>> getAllAccountingEmployee();

  //HR
  @POST(ApiConstants.addEmployee)
  Future<AddEmployeeResponse> addEmployee(
    @Body() AddEmployeeRequestBody addEmployeeRequestBody,
  );

  @GET(ApiConstants.getAllEmployees)
  Future<GetAllEmployeeResponse> getAllEmployees();

  @GET(ApiConstants.getAllRoles)
  Future<List<GetAllRolesResponse>> getAllRoles();

  @GET("${ApiConstants.getSpecificEmployee}/{employeeId}")
  Future<DetailsEmployeeModel> getSpecificEmployee(
    @Path("employeeId") String employeeId,
  );

  @DELETE("${ApiConstants.deleteEmployee}/{employeeId}")
  Future<void> deleteEmployee(
    @Path("employeeId") String employeeId,
  );

  @PUT("${ApiConstants.updateEmployee}/{employeeId}")
  Future<void> updateEmployee(
    @Path("employeeId") String employeeId,
    @Body() UpdateEmployeeRequest updateEmployeeRequest,
  );

  //Department
  @GET(ApiConstants.getAllDepartments)
  Future<List<GetAllDepartmentResponse>> getAllDepartment();

  @POST(ApiConstants.addDepartment)
  Future<AddDepartmentResponse> addDepartment(
    @Body() AddDepartmentRequest addDepartmentRequest,
  );

  @PUT(ApiConstants.updateDepartment)
  Future<UpdateDepartmentResponse> updateDepartment(
    @Path("id") int depId,
    @Body() UpdateDepartmentRequest updateDepartmentRequest,
  );

  @DELETE(ApiConstants.deleteDepartment)
  Future<ResponseDeleteCategory> deleteDepartment(
    @Path("id") int depId,
  );

  //attendance
  @GET(ApiConstants.getAllAttendance)
  Future<AttendanceResponse> getAllAttendance();

  //vacatoins
  @GET(ApiConstants.getAllVacations)
  Future<List<GetAllVacationModel>> getAllVacations();
  @POST(ApiConstants.applyVacation)
  Future<ApplyVacationResponse> applyVacation(
    @Body() ApplyVacationRequest applyVacationRequest,
  );
  @GET(ApiConstants.getAllVacationOfSpecificEmployee)
  Future<List<GetAllVacationModel>> getAllVacationOfSpecificEmployee();

  @PUT(ApiConstants.updateVacation)
  Future<UpdateVacationResponse> updateVacation(
    @Path("id") int id,
    @Body() UpdateVacationRequest updateVacationRequest,
  );
  @DELETE(ApiConstants.deleteVacation)
  Future<DeleteVacationResponse> deleteVacation(
    @Path("id") String id,
  );

  @PUT(ApiConstants.updateStatusOfVacation)
  Future<UpdateStatusOfVacationResponse> updateStatusOfVacation(
    @Path("id") String id,
    @Body() UpdateStatusOfVacationRequest updateStatusOfVacationRequest,
  );

  //job position
  @GET(ApiConstants.getAllJobPosition)
  Future<List<GetAllJobPositionResponse>> getAllJobPosition(
    @Path("departmentId") int depId,
  );

  @POST(ApiConstants.createJobPosition)
  Future<AddJobPositionResponse> addJobPosition(
    @Body() AddJobPositionRequest addJobPositionRequest,
  );

  @PUT(ApiConstants.updateJobPosition)
  Future<UpdateJobResponse> updateJobPosition(
    @Path("id") int id,
    @Body() UpdateJobRequest updateJobRequest,
  );
  @DELETE(ApiConstants.deleteJobPosition)
  Future<DeleteJobPositionResponse> deleteJobPosition(
    @Path("id") String id,
  );

  //permission

  @GET(ApiConstants.getAllPermission)
  Future<List<GetAllPermissionResponse>> getAllPermission();

  @GET(ApiConstants.getAllPermissionOfSpecificEmployee)
  Future<List<GetPermissionOfSpecificEmployeeResponse>>
      getAllPermissionOfSpecificEmployee();

  @POST(ApiConstants.addPermission)
  Future<AddPermissionResponse> addPermission(
    @Body() AddPermissionRequest addPermissionRequest,
  );

  @PUT(ApiConstants.updatePermission)
  Future<UpdatePermissionResponse> updatePermission(
    @Path("id") int id,
    @Body() UpdatePermissionRequest updatePermissionRequest,
  );
  @DELETE(ApiConstants.deletePermission)
  Future<DeletePermissionResponse> deletePermission(
    @Path("id") String id,
  );
  @PUT(ApiConstants.updateStatusOfPermission)
  Future<UpdateStatusOfPermissionResponse> updateStatusOfPermission(
    @Path("id") String id,
    @Body() UpdateStatusOfPermissionRequest updateStatusOfPermissionRequest,
  );

  //Accounting
  @GET(ApiConstants.getAllTaxes)
  Future<List<GetAllTaxesModel>> getAllTaxes();
  @POST(ApiConstants.addTaxes)
  Future<AddTaxesResponse> addTaxes(
    @Body() AddTaxesRequest AddTaxesRequest,
  );

  @GET(ApiConstants.getAllInvoicesOfSupplier)
  Future<List<GetAllInvoicesOfSupplierResponse>> getAllInvoicesOfSupplier(
    @Path("supplierId") int supplierId,
  );

  @POST(ApiConstants.registerPayment)
  Future<RegisterPaymentResponse> registerPayment(
    @Body() RegisterPaymentRequest registerPaymentRequest,
  );

  @GET(ApiConstants.getAllInvoices)
  Future<List<GetAllInvoicesResponse>> getAllInvoices();
}
