import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/inventory_drawer_item_list_view.dart';
import 'package:erp_system/features/inventory/transfer/transfer_orders/ui/widgets/transfer_of_orders_view_body.dart';
import 'package:flutter/material.dart';

class TransferOfOrdersView extends StatefulWidget {
  const TransferOfOrdersView({super.key});

  @override
  State<TransferOfOrdersView> createState() => _TransferOfOrdersViewState();
}

class _TransferOfOrdersViewState extends State<TransferOfOrdersView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: InventoryDrawerItemListView(),
      ),
      body: TransferOfOrdersViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
