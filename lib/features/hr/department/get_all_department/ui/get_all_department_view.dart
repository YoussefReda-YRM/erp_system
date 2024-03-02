import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/department/get_all_department/ui/widgets/get_all_department_view_body.dart';
import 'package:flutter/material.dart';

class GetAllDepartmentView extends StatefulWidget {
  const GetAllDepartmentView({super.key});

  @override
  State<GetAllDepartmentView> createState() => _GetAllDepartmentViewState();
}

class _GetAllDepartmentViewState extends State<GetAllDepartmentView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: HrDrawerItemListView(),
      ),
      body: GetAllDepartmentViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
