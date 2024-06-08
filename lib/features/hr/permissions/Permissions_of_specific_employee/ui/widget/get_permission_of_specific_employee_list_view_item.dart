import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/ui/widget/permission_popup_menu.dart';
import 'package:flutter/material.dart';

class GetAllPermissionOfSpecificEmployeeListViewItem extends StatelessWidget {
  const GetAllPermissionOfSpecificEmployeeListViewItem(
      {super.key, required this.data, required this.title});
  final GetPermissionOfSpecificEmployeeResponse data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: ColorsApp.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  AssetsData.profile,
                ),
              ),
              title: Text(
                "from : ${data.start!} To: ${data.end}",
                style: Styles.font14BlueSemiBold(context),
              ),
              subtitle: Row(
                children: [
                  Text(
                    data.date!,
                    style: Styles.font14BlueSemiBold(context),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      data.status == 0
                          ? "Pending"
                          : data.status == 1
                              ? "Accepted"
                              : data.status == 2
                                  ? "Rejected"
                                  : "Unknown Status",
                      style: Styles.font16DarkBlueBold(context).copyWith(
                        color: data.status == 0
                            ? Colors.orange
                            : data.status == 1
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: data.status == 0
                  ? PermissionPopupMenu(
                      permissionData: data,
                      title: title,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
