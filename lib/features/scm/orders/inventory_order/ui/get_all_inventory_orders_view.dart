import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/orders/inventory_order/ui/widgets/get_all_inventory_orders_view_body.dart';
import 'package:flutter/material.dart';

class GetAllInventoryOrdersView extends StatelessWidget {
  GetAllInventoryOrdersView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: ScmDrawerItemListView(),
      ),
      body: GetAllInventoryOrdersViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
