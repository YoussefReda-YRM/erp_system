import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/core/networking/dio_factory.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
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

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerFactory<LoginResponse>(() => loginResponseInGetIt!);

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

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
}
