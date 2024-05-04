import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/ui/widget/get_all_permissions_view_body.dart';
import 'package:flutter/material.dart';

class GetAllPermissionView extends StatefulWidget {
  const GetAllPermissionView({super.key});

  @override
  State<GetAllPermissionView> createState() => _GetAllPermissionViewState();
}

class _GetAllPermissionViewState extends State<GetAllPermissionView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: HrDrawerItemListView(),
      ),
      body: GetAllPermissionViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
