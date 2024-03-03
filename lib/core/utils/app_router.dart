import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/create_new_password/ui/create_new_password_view.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:erp_system/features/auth/sign_up/ui/register_view.dart';
import 'package:erp_system/features/hr/department/get_all_department/ui/get_all_department_view.dart';
import 'package:erp_system/features/hr/employee/add_employee/ui/add_employee_view.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/details_employee_view.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/get_all_employee_view.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/ui/add_parent_category_view.dart';
import 'package:erp_system/features/inventory/category/add_category/ui/add_sub_category_view.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/category_view.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/update_parent_category.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/update_sub_category.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_cubit.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/inventory_home_view.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/add_product_view.dart';
import 'package:erp_system/features/inventory/product/details_product/logic/details_product_cubit.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/details_product_view.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/get_all_product_view.dart';
import 'package:erp_system/features/inventory/replenishment/ui/reorder_view.dart';
import 'package:erp_system/features/inventory/replenishment/ui/replenishment_view.dart';
import 'package:erp_system/features/modules/ui/modules_view.dart';
import 'package:erp_system/features/auth/login/ui/login_view.dart';
import 'package:erp_system/features/auth/otp/ui/otp_view.dart';
import 'package:erp_system/features/auth/password_changed/password_changed_view.dart';
import 'package:erp_system/features/scm/orders/inventory_order/logic/get_all_inventory_orders_cubit.dart';
import 'package:erp_system/features/scm/orders/inventory_order/ui/get_all_inventory_orders_view.dart';
import 'package:erp_system/features/scm/orders/order_details/logic/order_details_cubit.dart';
import 'package:erp_system/features/scm/orders/order_details/ui/order_details_view.dart';
import 'package:erp_system/features/scm/orders/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/scm/orders/update_order/ui/update_order_view.dart';
import 'package:erp_system/features/scm/scm_home/logic/scm_home_cubit.dart';
import 'package:erp_system/features/scm/scm_home/ui/scm_home_view.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/ui/add_supplier_view.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/get_all_supplier_view.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supllier_details.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/ui/update_supplier.dart';
import 'package:erp_system/features/splash/ui/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kModulesView = '/modulesView';
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kOtpView = '/otpView';
  static const kCreateNewPasswordView = '/createNewPasswordView';
  static const kPasswordChangedView = '/passwordChangedView';

  //product
  static const kInventoryHomeView = '/inventoryHomeView';
  static const kProductView = '/productView';
  static const kAddProductView = '/addProductView';
  static const kDetailsProductView = '/detailsProductView';

  //category
  static const kCategoryView = '/categoryView';
  static const kUpdateSubCategory = '/updateSubCategory';
  static const kUpdateParentCategory = '/updateParentCategory';
  static const kAddParentCategory = '/addParentCategory';
  static const kAddSubCategory = '/addSubCategory';

  //replenishment
  static const kReplenishmentView = '/replenishmentView';
  static const kReorderView = '/reorderView';

  //supplier
  static const kSupplierView = '/supplierView';
  static const kSupplierDetails = '/supplierDetails';
  static const kAddSupplier = '/addsupplier';
  static const kUpdateSupplier = '/updatesupplier';

  static const kScmHomeView = '/scmHomeView';

  //order
  static const kInventoryOrders = '/inventoryOrders';
  static const kOrdersDetailsView = '/ordersDetailsView';
  static const kUpdateOrderView = '/updateOrderView';

  //HR
  static const kAllEmployeesView = '/allEmployeesView';
  static const kAddEmployeeView = '/addEmployeeView';
  static const kDetailsEmployeeView = '/detailsEmployeeView';
  static const kAllDepartmentsView = '/allDepartmentsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSupplierView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<GetAllSupplierCubit>()
            ..getAllSupplier(
              "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJCYXNtYU1vaHNlbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImJhc21hbW9oc2VuNTNAZ21haWwuY29tIiwiZXhwIjoxNzA4NzI1MzI2LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDY5IiwiYXVkIjoiTXlTZWN1cmVkQVBJVXNlcnMifQ.YtfYcIexDCmQQUZl7RHAXr07vQMdMzZISeHt0zG6qFM",
            ),
          child: const GetAllSupplierView(),
        ),
      ),
      GoRoute(
        path: kSupplierDetails,
        builder: (context, state) {
          Map<String, dynamic> myData = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => getIt.get<GetAllSupplierCubit>(),
            child: SupplierDetails(
              id: myData['id'],
              supplieraddedby: myData['addedBy'],
              supplierphone: myData['supplierPhone'],
              supplieremail: myData['supplierEmail'],
              suppliername: myData['supplierName'],
            ),
          );
        },
      ),
      GoRoute(
        path: kAddSupplier,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<AddSupplierCubit>(),
          child: const AddSupplierView(),
        ),
      ),
      GoRoute(
        path: kUpdateSupplier,
        builder: (context, state) {
          Map<String, dynamic> myData = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => getIt.get<UpdateSupplierCubit>(),
            child: UpdateSupplier(
              supplierId: myData['id'],
            ),
          );
        },
      ),

      GoRoute(
        path: kModulesView,
        builder: (context, state) => const ModulesView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: LoginView(role: state.extra as String),
        ),
      ),
      GoRoute(
        path: kInventoryHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<InventoryHomeCubit>()
            ..getNumberOfProductsAndReplenishment(),
          child: InventoryHomeView(),
        ),
      ),
      GoRoute(
        path: kProductView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<GetAllProductCubit>()
            ..getAllProduct(getIt.get<LoginResponse>().token),
          child: const GetAllProductView(),
        ),
      ),
      GoRoute(
        path: kUpdateSubCategory,
        builder: (context, state) {
          Map<String, dynamic> myData = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => getIt.get<UpdateSubCategoryCubit>(),
            child: UpdateSubCategory(
              parentid: myData['parentId'],
              subid: myData['subId'],
            ),
          );
        },
      ),
      GoRoute(
        path: kUpdateParentCategory,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt.get<UpdateParentCategoryCubit>(),
            child: UpdateParentCategory(
              parentId: state.extra as int,
            ),
          );
        },
      ),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<CategoryCubit>()
            ..getAllCategories(
              getIt.get<LoginResponse>().token!,
            ),
          child: const CategoryView(),
        ),
      ),
      GoRoute(
        path: kAddParentCategory,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<AddParentCategoryCubit>(),
          child: const AddParentCategoryView(),
        ),
      ),
      GoRoute(
        path: kAddSubCategory,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<AddSubCategoryCubit>(),
          child: AddSubCategoryView(parentId: state.extra as int),
        ),
      ),
      GoRoute(
        path: kAddProductView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<AddProductCubit>(),
          child: const AddProductView(),
        ),
      ),
      GoRoute(
        path: kDetailsProductView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<DetailsProductCubit>()
            ..getProductById(
              getIt.get<LoginResponse>().token,
              state.extra as int,
            ),
          child: const DetailsProductView(),
        ),
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

      //replenishment
      GoRoute(
        path: kReplenishmentView,
        builder: (context, state) => ReplenishmentView(),
      ),

      GoRoute(
        path: kReorderView,
        builder: (context, state) => const ReorderView(),
      ),

      GoRoute(
        path: kScmHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt.get<ScmHomeCubit>()..getNumberOfInventoryAndScmOrders(),
          child: ScmHomeView(),
        ),
      ),

      GoRoute(
        path: kInventoryOrders,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              getIt.get<GetAllInventoryOrdersCubit>()..getAllInventoryOrders(),
          child: const GetAllInventoryOrdersView(),
        ),
      ),

      GoRoute(
        path: kOrdersDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt.get<OrderDetailsCubit>()
            ..getSpecificInventoryOrder(
              state.extra as int,
            ),
          child: const OrderDetailsView(),
        ),
      ),

      GoRoute(
        path: kUpdateOrderView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt.get<UpdateOrderCubit>(),
            child: UpdateOrderView(
              orderId: state.extra as int,
            ),
          );
        },
      ),

      //HR
      GoRoute(
        path: kAllEmployeesView,
        builder: (context, state) => const GetAllEmployeeView(),
      ),
      GoRoute(
        path: kAllDepartmentsView,
        builder: (context, state) => const GetAllDepartmentView(),
      ),
      GoRoute(
        path: kAddEmployeeView,
        builder: (context, state) => const AddEmployeeView(),
      ),
      GoRoute(
        path: kDetailsEmployeeView,
        builder: (context, state) => const DetailsEmployeeView(),
      ),
    ],
  );
}
