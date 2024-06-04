import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/ui/widgets/get_all_scm_orders_view_body.dart';
import 'package:flutter/material.dart';

class GetAllScmOrdersView extends StatefulWidget {
  const GetAllScmOrdersView({super.key, required this.title});

  final String title;

  @override
  State<GetAllScmOrdersView> createState() => _GetAllScmOrdersViewState();
}

class _GetAllScmOrdersViewState extends State<GetAllScmOrdersView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(
        drawerItemListView: widget.title == 'scm'
            ? const ScmDrawerItemListView()
            : const AccountingDrawerItemListView(),
      ),
      body: GetAllScmOrdersViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
