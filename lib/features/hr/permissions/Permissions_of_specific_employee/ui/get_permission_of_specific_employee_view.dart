import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/ui/widget/get_permission_of_specific_employee_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetPermissionOfSpecificEmployeeView extends StatefulWidget {
  const GetPermissionOfSpecificEmployeeView({super.key});

  @override
  State<GetPermissionOfSpecificEmployeeView> createState() => _GetPermissionOfSpecificEmployeeState();
}

class _GetPermissionOfSpecificEmployeeState extends State<GetPermissionOfSpecificEmployeeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: HrDrawerItemListView(),
      ),
      body: GetPermissionOfSpecificEmployeeViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Row(
          children: [
            const Spacer(),
            CustomFloatingActionButton(
              ctxt: context,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kAddPermissionView);
              },
            ),
          ],
        ),
      ),

    );
  }
}
