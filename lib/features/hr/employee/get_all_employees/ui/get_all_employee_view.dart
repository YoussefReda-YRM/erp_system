import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:erp_system/features/hr/department/get_all_department/logic/get_all_department_cubit.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/get_all_roles_cubit.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/widgets/get_all_employee_view_body.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GetAllEmployeeView extends StatefulWidget {
  const GetAllEmployeeView({super.key});

  @override
  State<GetAllEmployeeView> createState() => _GetAllEmployeeViewState();
}

class _GetAllEmployeeViewState extends State<GetAllEmployeeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<GetAllDepartmentCubit>().getAllDepartment();
    context.read<GetAllRolesCubit>().getAllRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: HrDrawerItemListView(),
      ),
      body: GetAllEmployeeViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton:
          getIt.get<LoginResponse>().userData?.role == "HRAdmin" ||
                  getIt.get<LoginResponse>().userData?.role == "HREmployee"
              ? Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          backgroundColor: ColorsApp.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.picture_as_pdf,
                                color: ColorsApp.lightGrey,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Export To PDF",
                                style: Styles.font18LightGreyBold(context)
                                    .copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomFloatingActionButton(
                        ctxt: context,
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kAddEmployeeView);
                        },
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
    );
  }
}
