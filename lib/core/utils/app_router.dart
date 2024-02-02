import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/create_new_password/ui/create_new_password_view.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:erp_system/features/auth/sign_up/ui/register_view.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/inventory_home_view.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/details_product_view.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/get_all_product_view.dart';
import 'package:erp_system/features/modules/ui/modules_view.dart';
import 'package:erp_system/features/auth/login/ui/login_view.dart';
import 'package:erp_system/features/auth/otp/ui/otp_view.dart';
import 'package:erp_system/features/auth/password_changed/password_changed_view.dart';
import 'package:erp_system/features/splash/ui/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kModulesView = '/modulesView';
  static const kLoginView = '/loginView';
  static const kInventoryHomeView = '/inventoryHomeView';
  static const kProductView = '/productView';
  static const kDetailsProductView = '/detailsProductView';
  static const kSignupView = '/signupView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kOtpView = '/otpView';
  static const kCreateNewPasswordView = '/createNewPasswordView';
  static const kPasswordChangedView = '/passwordChangedView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kModulesView,
        builder: (context, state) => const ModulesView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kInventoryHomeView,
        builder: (context, state) => InventoryHomeView(),
      ),
      GoRoute(
        path: kProductView,
        builder: (context, state) => BlocProvider(
            create: (context) => getIt.get<GetAllProductCubit>(),
            child: GetAllProductView()),
      ),
      GoRoute(
        path: kDetailsProductView,
        builder: (context, state) => const DetailsProductView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => BlocProvider(
            create: (context) => getIt.get<SignupCubit>(),
            child: const SignupView()),
      ),
      GoRoute(
        path: kOtpView,
        builder: (context, state) => const OtpView(),
      ),
      GoRoute(
        path: kCreateNewPasswordView,
        builder: (context, state) => const CreateNewPasswordView(),
      ),
      GoRoute(
        path: kPasswordChangedView,
        builder: (context, state) => const PasswordChangedView(),
      ),
    ],
  );
}
