import 'package:erp_system/features/inventory/inventory_home/ui/widgets/custom_app_bar_inventory.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/widgets/list_of_card.dart';
import 'package:flutter/material.dart';

class InventoryHomeViewBody extends StatelessWidget {
    final GlobalKey<ScaffoldState> scaffoldKey ;

  const InventoryHomeViewBody({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        CustomAppBarInventory(scaffoldKey: scaffoldKey),
        const ListOfCards(),
      ],
    );
  }
}
