import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({
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
              color: ColorsApp.lightGrey,
            ),
            title: Text(
              drawerItemModel.title,
              maxLines: 1,
              style: Styles.font18LightGreyBold(context),
            ),
          );
  }
}
