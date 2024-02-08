import 'package:dio/dio.dart';
import 'package:erp_system/core/networking/api_service.dart';
import 'package:erp_system/core/networking/dio_factory.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/data/repos/delete_category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/get_all_category_cubit.dart';
import 'package:erp_system/features/inventory/category/logic/delete_category_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/repos/get_all_product_repo.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //get all product
  getIt.registerLazySingleton<GetAllProductRepo>(() => GetAllProductRepo(getIt()));
  getIt.registerFactory<GetAllProductCubit>(() => GetAllProductCubit(getIt()));

  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  getIt.registerLazySingleton<DeleteCategoryRepo>(() => DeleteCategoryRepo(getIt()));
  getIt.registerFactory<DeleteCategoryCubit>(() => DeleteCategoryCubit(getIt()));



}
