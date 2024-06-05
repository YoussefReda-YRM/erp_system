import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/helpers/shared_pref_helper.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/modules/ui/widgets/item_module.dart';
import 'package:flutter/material.dart';

class ItemsModules extends StatefulWidget {
  const ItemsModules({super.key});

  @override
  State<ItemsModules> createState() => _ItemsModulesState();
}

class _ItemsModulesState extends State<ItemsModules> {
  @override
  void initState() async {
    super.initState();
    userRole = await SharedPrefHelper.getString(SharedPrefKeys.userRole);
  }

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
              userRole == "SuperAdmin" || userRole == "SCMEmployee"
                  ? itemModule(context, 'SCM', AssetsData.scm)
                  : const SizedBox(),
              userRole == "SuperAdmin" ||
                      userRole == "HREmployee" ||
                      userRole == "HRAdmin"
                  ? itemModule(context, 'HR', AssetsData.hr)
                  : const SizedBox(),
              userRole == "SuperAdmin" || userRole == "AccountingEmployee"
                  ? itemModule(context, 'Accounting', AssetsData.accounting)
                  : const SizedBox(),
              userRole == "SuperAdmin" || userRole == "InventoryEmployee"
                  ? itemModule(context, 'Inventory', AssetsData.inventory)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
