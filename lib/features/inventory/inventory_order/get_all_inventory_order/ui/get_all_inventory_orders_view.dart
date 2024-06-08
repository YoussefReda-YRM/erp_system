import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/inventory_drawer_item_list_view.dart';
import 'package:erp_system/features/inventory/inventory_order/get_all_inventory_order/ui/widgets/get_all_inventory_orders_view_body.dart';
import 'package:flutter/material.dart';

class GetAllInventoryOrdersView extends StatefulWidget {
  const GetAllInventoryOrdersView({super.key, required this.title});

  final String title;

  @override
  State<GetAllInventoryOrdersView> createState() =>
      _GetAllInventoryOrdersViewState();
}

class _GetAllInventoryOrdersViewState extends State<GetAllInventoryOrdersView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(
        drawerItemListView: widget.title == "accounting"
            ? const AccountingDrawerItemListView()
            : const InventoryDrawerItemListView(),
      ),
      body: GetAllInventoryOrdersViewBody(
        scaffoldKey: scaffoldKey,
        title: widget.title,
      ),
    );
  }
}
