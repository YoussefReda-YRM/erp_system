import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/inventory_home/ui/widgets/custom_card_inventory.dart';
import 'package:flutter/material.dart';

class ListOfCards extends StatelessWidget {
  const ListOfCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GridView.count(
            padding: const EdgeInsets.only(bottom: 30),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            crossAxisSpacing: 40,
            mainAxisSpacing: 30,
            children: [
              customCardInventory(
                  context, 'All Products: 1000000', AssetsData.product),
              customCardInventory(
                  context, 'Replienshment: 24', AssetsData.replensh),
            ],
          ),
        ),
      ),
    );
  }
}
