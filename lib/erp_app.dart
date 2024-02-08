import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/category/logic/get_all_category_cubit.dart';
import 'package:erp_system/features/inventory/category/logic/delete_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'path_to_your_blocs.dart';
// Import your BLoCs here

class ErpApp extends StatelessWidget {
  const ErpApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DeleteCategoryCubit>(
            create: (context) => getIt<DeleteCategoryCubit>(),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) => getIt<CategoryCubit>(),
          ),
          // Add other BlocProviders if needed
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          title: 'ERP System',
          theme: ThemeData(
            primaryColor: ColorsApp.moreLightGrey,
            scaffoldBackgroundColor: ColorsApp.moreLightGrey,
          ),
        ),
      ),
    );
  }
}
