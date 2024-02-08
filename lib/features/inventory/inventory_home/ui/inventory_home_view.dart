import 'package:erp_system/core/widgets/drawer_widget.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/widgets/inventory_home_view_body.dart';
import 'package:flutter/material.dart';

class InventoryHomeView extends StatelessWidget {
  InventoryHomeView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: InventoryHomeViewBody(
        scaffoldKey: scaffoldKey,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
