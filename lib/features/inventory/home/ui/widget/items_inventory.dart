import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/modules/ui/widgets/item_module.dart';
import 'package:flutter/material.dart';

class ItemsInventory extends StatelessWidget {
  const ItemsInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100,right:100,top: 50,bottom: 50),
      child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                itemModule('products', AssetsData.product),
                itemModule('Replienshment', AssetsData.replensh),

              ]),
    );
  }
}
