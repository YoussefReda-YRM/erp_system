import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/widgets/get_all_employee_view_body.dart';
import 'package:flutter/material.dart';

class GetAllEmployeeView extends StatefulWidget {
  const GetAllEmployeeView({super.key});

  @override
  State<GetAllEmployeeView> createState() => _GetAllDepartmentViewState();
}

class _GetAllDepartmentViewState extends State<GetAllEmployeeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
      // floatingActionButton: AddEmployeeFloatingActionButton(
      //   ctxt: context,
      // ),
    );
  }
}
