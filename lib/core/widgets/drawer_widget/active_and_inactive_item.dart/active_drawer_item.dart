import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({
    super.key,
    required this.drawerItemModel,
  });

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return userRole == "SuperAdmin" && (drawerItemModel.title == "Adjustment" || drawerItemModel.title == "Create Orders")
        ? const SizedBox()
        : ListTile(
            leading: Icon(
              drawerItemModel.icon,
              color: Colors.pink,
            ),
            title: Text(
              drawerItemModel.title,
              maxLines: 1,
              style: Styles.font18DarkBlueBold(context)
                  .copyWith(color: Colors.pink),
            ),
            trailing: Container(
              width: 3,
              decoration: const BoxDecoration(color: Colors.pink),
            ),
          );
  }
}
