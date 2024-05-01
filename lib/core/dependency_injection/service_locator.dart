import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/core/networking/dio_factory.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/hr/attendance/data/repos/attendance_repo.dart';
import 'package:erp_system/features/hr/attendance/logic/get_all_attendance_cubit.dart';
import 'package:erp_system/features/hr/department/delete_department/data/repos/delete_department_repo.dart';
import 'package:erp_system/features/hr/department/delete_department/logic/delete_department_cubit.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/models/get_all_roles_model.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/repos/Add_employee_repo.dart';
import 'package:erp_system/features/hr/employee/add_employee/data/repos/get_all_roles_repo.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/get_all_roles_cubit.dart';
import 'package:erp_system/features/hr/employee/details_employee/data/repo/details_employee_repo.dart';
import 'package:erp_system/features/hr/employee/details_employee/logic/details_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/repos/get_all_employee_repo.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/logic/get_all_employee_cubit.dart';
import 'package:erp_system/features/hr/department/add_department/data/repos/add_department_repo.dart';
import 'package:erp_system/features/hr/department/add_department/logic/add_department_cubit.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/repos/get_all_department_repo.dart';
import 'package:erp_system/features/hr/department/get_all_department/logic/get_all_department_cubit.dart';
import 'package:erp_system/features/hr/department/update_department/data/repos/update_department_repo.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_cubit.dart';
import 'package:erp_system/features/hr/employee/update_employee/data/repos/update_employee_repo.dart';
import 'package:erp_system/features/hr/employee/update_employee/logic/update_employee_cubit.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/data/repos/add_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/logic/add_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/data/repos/delete_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/delete_job_position/logic/delete_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/models/GetAllJobPositionResponse.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/data/repos/get_all_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/logic/get_all_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/data/repos/update_job_position_repo.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_cubit.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/repos/get_permission_of_specific_employee_repo.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/logic/get_permission_of_specific_employee_cubit.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/data/repos/add_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/data/repos/delete_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/logic/delete_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/data/repos/get_all_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/logic/get_all_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/repos/update_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/data/repos/update_status_of_permission_repo.dart';
import 'package:erp_system/features/hr/permissions/update_status_of_permission/logic/update_status_of_permission_cubit.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/data/repos/apply_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/delete_vacation/data/repos/delete_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/delete_vacation/logic/delete_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/repos/get_all_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/logic/get_all_vacations_cubit.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/data/repos/update_vacation_repo.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/vacation_of_specific_employee/data/repos/get_all_vacation_of_specific_employee_repo.dart';
import 'package:erp_system/features/hr/vacations/vacation_of_specific_employee/logic/get_all_vacation_of_specific_employee_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/data/repos/add_parent_category_repo.dart';
import 'package:erp_system/features/inventory/category/add_category/data/repos/add_sub_category_repo.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/repos/delete_parent_category_repo.dart';
import 'package:erp_system/features/inventory/category/delete_category/data/repos/delete_sub_category_repo.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
import 'package:erp_system/features/inventory/category/get_all_category/data/repos/get_category_repo.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/data/repos/update_parent_category_repo.dart';
import 'package:erp_system/features/inventory/category/update_category/data/repos/update_sub_category_repo.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/inventory_home/data/repo/inventory_home_repo.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/data/repos/add_product_repo.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/details_product/data/repo/details_product_repo.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/repos/get_all_product_repo.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/scm/orders/inventory_order/data/repos/get_all_inventory_orders_repo.dart';
import 'package:erp_system/features/scm/orders/inventory_order/logic/get_all_inventory_orders_cubit.dart';
import 'package:erp_system/features/scm/orders/order_details/data/repos/order_details_repo.dart';
import 'package:erp_system/features/scm/orders/order_details/logic/order_details_cubit.dart';
import 'package:erp_system/features/scm/orders/update_order/data/repos/update_order_repo.dart';
import 'package:erp_system/features/scm/orders/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/data/repos/add_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/repos/get_all_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_cubit.dart';
import 'package:erp_system/features/scm/scm_home/data/repo/scm_home_repo.dart';
import 'package:erp_system/features/scm/scm_home/logic/scm_home_cubit.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/data/repos/update_supplier_repo.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
LoginResponse? loginResponseInGetIt;

List<CategoryAllCategoryModel>? categoriesInGetIt;
List<GetAllJobPositionResponse>? jobPositionInGetIt;

int activeIndex = 0;

int indexOfListViewInGetAllCategory = 0;

bool listOfCategoryIsEmpty = false;

String parentCategoryNameControllerInGetIt = '';
String subCategoryNameControllerInGetIt = '';

String supplierNameControllerInGetIt = '';
String supplierEmailControllerInGetIt = '';
String supplierPhoneControllerInGetIt = '';

String accEmployeeIdControllerInGetIt = '';
String quantityControllerInGetIt = '';
String referenceControllerInGetIt = '';
String departmentNameControllerInGetIt = '';
String departmentDescriptionInGetIt = '';

String startTimeOfPermissionInGetIt = '';
String endTimeOfPermissionInGetIt = '';
String dateOfPermissionInGetIt = '';
String descriptionOfPermissionInGetIt = '';



List<GetAllDepartmentResponse> getAllDepartmentGetIt = [];
List<GetAllRolesResponse> getAllRolesGetIt = [];

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerFactory<LoginResponse>(() => loginResponseInGetIt!);

  //add product
  getIt.registerLazySingleton<AddProductRepo>(() => AddProductRepo(getIt()));
  getIt.registerFactory<AddProductCubit>(() => AddProductCubit(getIt()));

  // get numbers of product and replenishment
  getIt.registerLazySingleton<InventoryHomeRepo>(
      () => InventoryHomeRepo(getIt()));
  getIt.registerFactory<InventoryHomeCubit>(() => InventoryHomeCubit(getIt()));

  //get all product
  getIt.registerLazySingleton<GetAllProductRepo>(
      () => GetAllProductRepo(getIt()));
  getIt.registerFactory<GetAllProductCubit>(() => GetAllProductCubit(getIt()));

  getIt.registerFactory<List<CategoryAllCategoryModel>>(
      () => categoriesInGetIt!);

  //get product by id
  getIt.registerLazySingleton<DetailsProductRepo>(
      () => DetailsProductRepo(getIt()));
  getIt
      .registerFactory<DetailsProductCubit>(() => DetailsProductCubit(getIt()));

  //categories

  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  getIt.registerLazySingleton<DeleteSubCategoryRepo>(
      () => DeleteSubCategoryRepo(getIt()));
  // getIt.registerFactory<DeleteSubCategoryCubit>(
  //     () => DeleteSubCategoryCubit(getIt()));

  getIt.registerLazySingleton<AddParentCategoryRepo>(
      () => AddParentCategoryRepo(getIt()));
  getIt.registerFactory<AddParentCategoryCubit>(
      () => AddParentCategoryCubit(getIt()));

  getIt.registerLazySingleton<UpdateSubCategoryRepo>(
      () => UpdateSubCategoryRepo(getIt()));
  getIt.registerFactory<UpdateSubCategoryCubit>(
      () => UpdateSubCategoryCubit(getIt()));

  getIt.registerLazySingleton<UpdateParentCategoryRepo>(
      () => UpdateParentCategoryRepo(getIt()));
  getIt.registerFactory<UpdateParentCategoryCubit>(
      () => UpdateParentCategoryCubit(getIt()));

  getIt.registerLazySingleton<DeleteParentCategoryRepo>(
      () => DeleteParentCategoryRepo(getIt()));
  // getIt.registerFactory<DeleteParentCategoryCubit>(
  //     () => DeleteParentCategoryCubit(getIt()));

  getIt.registerLazySingleton<AddSubCategoryRepo>(
      () => AddSubCategoryRepo(getIt()));
  getIt
      .registerFactory<AddSubCategoryCubit>(() => AddSubCategoryCubit(getIt()));

  // Supplier
  getIt.registerLazySingleton<GetAllSupplierRepo>(
      () => GetAllSupplierRepo(getIt()));
  getIt
      .registerFactory<GetAllSupplierCubit>(() => GetAllSupplierCubit(getIt()));

  getIt.registerLazySingleton<AddSupplierRepo>(() => AddSupplierRepo(getIt()));
  getIt.registerFactory<AddSupplierCubit>(() => AddSupplierCubit(getIt()));

  getIt.registerLazySingleton<UpdateSupplierRepo>(
      () => UpdateSupplierRepo(getIt()));
  getIt
      .registerFactory<UpdateSupplierCubit>(() => UpdateSupplierCubit(getIt()));

  // get numbers of inventory and Scm Orders
  getIt.registerLazySingleton<ScmHomeRepo>(() => ScmHomeRepo(getIt()));
  getIt.registerFactory<ScmHomeCubit>(() => ScmHomeCubit(getIt()));

  getIt.registerLazySingleton<GetAllInventoryOrdersRepo>(
      () => GetAllInventoryOrdersRepo(getIt()));
  getIt.registerFactory<GetAllInventoryOrdersCubit>(
      () => GetAllInventoryOrdersCubit(getIt()));

  getIt
      .registerLazySingleton<OrderDetailsRepo>(() => OrderDetailsRepo(getIt()));
  getIt.registerFactory<OrderDetailsCubit>(() => OrderDetailsCubit(getIt()));

  getIt.registerLazySingleton<UpdateOrderRepo>(() => UpdateOrderRepo(getIt()));
  getIt.registerFactory<UpdateOrderCubit>(() => UpdateOrderCubit(getIt()));

  // hr
  //add employee
  getIt.registerLazySingleton<AddEmployeeRepo>(() => AddEmployeeRepo(getIt()));
  getIt.registerFactory<AddEmployeeCubit>(() => AddEmployeeCubit(getIt()));

  getIt.registerLazySingleton<GetAllEmployeeRepo>(
      () => GetAllEmployeeRepo(getIt()));
  getIt
      .registerFactory<GetAllEmployeeCubit>(() => GetAllEmployeeCubit(getIt()));

  getIt.registerLazySingleton<DetailsEmployeeRepo>(
      () => DetailsEmployeeRepo(getIt()));
  getIt.registerFactory<DetailsEmployeeCubit>(
      () => DetailsEmployeeCubit(getIt()));

  getIt.registerLazySingleton<UpdateEmployeeRepo>(
      () => UpdateEmployeeRepo(getIt()));
  getIt
      .registerFactory<UpdateEmployeeCubit>(() => UpdateEmployeeCubit(getIt()));

  getIt.registerLazySingleton<GetAllRolesRepo>(() => GetAllRolesRepo(getIt()));
  getIt.registerFactory<GetAllRolesCubit>(() => GetAllRolesCubit(getIt()));

  //department
  getIt.registerLazySingleton<GetAllDepartmentRepo>(
      () => GetAllDepartmentRepo(getIt()));
  getIt.registerFactory<GetAllDepartmentCubit>(
      () => GetAllDepartmentCubit(getIt()));

  getIt.registerLazySingleton<AddDepartmentRepo>(
      () => AddDepartmentRepo(getIt()));
  getIt.registerFactory<AddDepartmentCubit>(() => AddDepartmentCubit(getIt()));

  getIt.registerLazySingleton<UpdateDepartmentRepo>(
      () => UpdateDepartmentRepo(getIt()));
  getIt.registerFactory<UpdateDepartmentCubit>(
      () => UpdateDepartmentCubit(getIt()));

  getIt.registerLazySingleton<DeleteDepartmentRepo>(
      () => DeleteDepartmentRepo(getIt()));
  getIt.registerFactory<DeleteDepartmentCubit>(
      () => DeleteDepartmentCubit(getIt()));

  //attendance
  getIt.registerLazySingleton<AttendanceRepo>(() => AttendanceRepo(getIt()));
  getIt.registerFactory<GetAllAttendanceCubit>(
      () => GetAllAttendanceCubit(getIt()));

  //vacations
  getIt.registerLazySingleton<GetAllVacationRepo>(
      () => GetAllVacationRepo(getIt()));
  getIt.registerFactory<GetAllVacationsCubit>(
      () => GetAllVacationsCubit(getIt()));
  getIt.registerLazySingleton<ApplyVacationRepo>(
          () => ApplyVacationRepo(getIt()));
  getIt.registerFactory<ApplyVacationCubit>(() => ApplyVacationCubit(getIt()));

  getIt.registerLazySingleton<GetAllVacationOfSpecificEmployeeRepo>(
          () => GetAllVacationOfSpecificEmployeeRepo(getIt()));
  getIt.registerFactory<GetAllVacationOfSpecificEmployeeCubit>(
          () => GetAllVacationOfSpecificEmployeeCubit(getIt()));

  getIt.registerLazySingleton<UpdateVacationRepo>(
          () => UpdateVacationRepo(getIt()));
  getIt.registerFactory<UpdateVacationCubit>(
          () => UpdateVacationCubit(getIt()));

  getIt.registerLazySingleton<DeleteVacationRepo>(
          () => DeleteVacationRepo(getIt()));
  getIt.registerFactory<DeleteVacationCubit>(
          () => DeleteVacationCubit(getIt()));

  //job position
  getIt.registerLazySingleton<GetAllJobPositionRepo>(
          () => GetAllJobPositionRepo(getIt()));
  getIt.registerFactory<GetAllJobPositionCubit>(
          () => GetAllJobPositionCubit(getIt()));

  getIt.registerLazySingleton<AddJobPositionRepo>(
          () => AddJobPositionRepo(getIt()));
  getIt.registerFactory<AddJobPositionCubit>(
          () => AddJobPositionCubit(getIt()));

  getIt.registerLazySingleton<UpdateJobPositionRepo>(
          () => UpdateJobPositionRepo(getIt()));
  getIt.registerFactory<UpdateJObPositionCubit>(
          () => UpdateJObPositionCubit(getIt()));

  getIt.registerLazySingleton<DeleteJobPositionRepo>(
          () => DeleteJobPositionRepo(getIt()));
  getIt.registerFactory<DeleteJobPositionCubit>(
          () => DeleteJobPositionCubit(getIt()));

  //permissions
  getIt.registerLazySingleton<GetAllPermissionRepo>(
          () => GetAllPermissionRepo(getIt()));
  getIt.registerFactory<GetAllPermissionCubit>(
          () => GetAllPermissionCubit(getIt()));

  getIt.registerLazySingleton<GetPermissionOfSpecificEmployeeRepo>(
          () => GetPermissionOfSpecificEmployeeRepo(getIt()));
  getIt.registerFactory<GetPermissionOfSpecificEmployeeCubit>(
          () => GetPermissionOfSpecificEmployeeCubit(getIt()));

  getIt.registerLazySingleton<AddPermissionRepo>(
          () => AddPermissionRepo(getIt()));
  getIt.registerFactory<AddPermissionCubit>(
          () => AddPermissionCubit(getIt()));

  getIt.registerLazySingleton<UpdatePermissionRepo>(
          () => UpdatePermissionRepo(getIt()));
  getIt.registerFactory<UpdatePermissionCubit>(
          () => UpdatePermissionCubit(getIt()));

  getIt.registerLazySingleton<DeletePermissionRepo>(
          () => DeletePermissionRepo(getIt()));
  getIt.registerFactory<DeletePermissionCubit>(
          () => DeletePermissionCubit(getIt()));

  getIt.registerLazySingleton<UpdateStatusOfPermissionRepo>(
          () => UpdateStatusOfPermissionRepo(getIt()));
  getIt.registerFactory<UpdateStatusOfPermissionCubit>(
          () => UpdateStatusOfPermissionCubit(getIt()));


}
