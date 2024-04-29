import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/ui/widget/get_permission_of_specific_employee_view_body.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
