import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/core/networking/dio_factory.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:erp_system/features/inventory/inventory_home/data/repo/inventory_home_repo.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/data/repos/add_product_repo.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/details_product/data/repo/details_product_repo.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/repos/get_all_product_repo.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
LoginResponse? loginResponseInGetIt;
int activeIndex = 0;

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

  //get product by id
  getIt.registerLazySingleton<DetailsProductRepo>(
      () => DetailsProductRepo(getIt()));
  getIt
      .registerFactory<DetailsProductCubit>(() => DetailsProductCubit(getIt()));
}
