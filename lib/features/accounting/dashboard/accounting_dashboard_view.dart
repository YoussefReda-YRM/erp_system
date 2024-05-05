import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/accounting/dashboard/accounting_dashboard_view_body.dart';
import 'package:flutter/material.dart';

class AccountingDashboardView extends StatefulWidget {
  const AccountingDashboardView({super.key});

  @override
  State<AccountingDashboardView> createState() =>
      _AccountingDashboardViewState();
}

class _AccountingDashboardViewState extends State<AccountingDashboardView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: AccountingDrawerItemListView(),
      ),
      body: AccountingDashboardViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
