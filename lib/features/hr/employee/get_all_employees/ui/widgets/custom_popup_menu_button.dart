import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'edit') {
          // Handle edit action
          print('Edit pressed');
        } else if (value == 'delete') {
          // Handle delete action
          print('Delete pressed');
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'edit',
          child: ListTile(
            leading: const Icon(
              Icons.edit,
              color: ColorsApp.primaryColor,
            ),
            title: Text(
              'Edit',
              style: Styles.font14BlueSemiBold(context),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: Text(
              'Delete',
              style: Styles.font14BlueSemiBold(context),
            ),
          ),
        ),
      ],
    );
  }
}
