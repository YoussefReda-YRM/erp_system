import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/ui/widgets/get_all_vacations_view_body.dart';
import 'package:flutter/material.dart';

class GetAllVacationsView extends StatefulWidget {
  const GetAllVacationsView({super.key});

  @override
  State<GetAllVacationsView> createState() => _GetAllCavationsViewState();
}

class _GetAllCavationsViewState extends State<GetAllVacationsView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: HrDrawerItemListView(),
      ),
      body: GetAllVacationsViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
