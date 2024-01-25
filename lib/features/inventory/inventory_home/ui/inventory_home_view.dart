import 'package:erp_system/features/inventory/inventory_home/ui/widgets/drawer_content.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/widgets/inventory_home_view_body.dart';
import 'package:flutter/material.dart';

class InventoryHomeView extends StatefulWidget {
  const InventoryHomeView({super.key});

  @override
  State<InventoryHomeView> createState() => _InventoryHomeViewState();
}

class _InventoryHomeViewState extends State<InventoryHomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: InventoryHomeViewBody(scaffoldKey: scaffoldKey,),
      drawer: const DrawerContent(),
    );
  }
}
