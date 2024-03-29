import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/modules/ui/widgets/item_module.dart';
import 'package:flutter/material.dart';

class ItemsModules extends StatelessWidget {
  const ItemsModules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 30,
            children: [
              itemModule(context, 'SCM', AssetsData.scm),
              itemModule(context, 'HR', AssetsData.hr),
              itemModule(context, 'Accounting', AssetsData.accounting),
              itemModule(context, 'Inventory', AssetsData.inventory),
            ],
          ),
        ),
      ),
    );
  }
}
