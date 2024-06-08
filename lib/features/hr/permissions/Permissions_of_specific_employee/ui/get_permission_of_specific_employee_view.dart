import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/inventory_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/ui/widget/get_permission_of_specific_employee_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetPermissionOfSpecificEmployeeView extends StatefulWidget {
  const GetPermissionOfSpecificEmployeeView({super.key, required this.title});

  final String title;

  @override
  State<GetPermissionOfSpecificEmployeeView> createState() =>
      _GetPermissionOfSpecificEmployeeState();
}

class _GetPermissionOfSpecificEmployeeState
    extends State<GetPermissionOfSpecificEmployeeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: widget.title == "accounting"
          ? const DrawerWidget(
              drawerItemListView: AccountingDrawerItemListView(),
            )
          : widget.title == "hr"
              ? const DrawerWidget(
                  drawerItemListView: HrDrawerItemListView(),
                )
              : widget.title == "inventory"
                  ? const DrawerWidget(
                      drawerItemListView: InventoryDrawerItemListView(),
                    )
                  : const DrawerWidget(
                      drawerItemListView: ScmDrawerItemListView(),
                    ),
      body: GetPermissionOfSpecificEmployeeViewBody(
        scaffoldKey: scaffoldKey,
        title: widget.title,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: CustomFloatingActionButton(
          ctxt: context,
          onPressed: () {
            GoRouter.of(context)
                .push(AppRouter.kAddPermissionView, extra: widget.title);
          },
        ),
      ),
    );
  }
}
