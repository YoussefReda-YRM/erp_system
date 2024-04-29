import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:flutter/material.dart';

class GetAllPermissionOfSpecificEmployeeListViewItem extends StatelessWidget {
  const GetAllPermissionOfSpecificEmployeeListViewItem({super.key,required this.data});
  final GetPermissionOfSpecificEmployeeResponse data;

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
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  AssetsData.profile,
                ),
              ),
              title: Text(
                data.employee!,
                style: Styles.font14BlueSemiBold(context),
              ),
              subtitle: Row(
                children: [
                  Text("${data.start} - ${data.end}",
                      style: Styles.font16DarkBlueBold(context)),
                  const   Spacer(),
                  Text("${data.date}",
                      style: Styles.font16DarkBlueBold(context)),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
