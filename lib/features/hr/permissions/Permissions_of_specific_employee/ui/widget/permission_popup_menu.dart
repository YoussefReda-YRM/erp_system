import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/delete_permission/logic/delete_permission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PermissionPopupMenu extends StatelessWidget {
  const PermissionPopupMenu(
      {super.key, required this.permissionData, required this.title});
  final GetPermissionOfSpecificEmployeeResponse permissionData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      icon: const Icon(
        Icons.more_vert_outlined,
        color: Colors.pink, // Change the color here
      ),
      onSelected: (value) {
        if (value == 'edit') {
          GoRouter.of(context).push(
            AppRouter.kUpdatePermissionView,
            extra: {"data": permissionData, "title": title},
          );
        } else if (value == 'delete') {
          deleteShowDialog(
            context,
            'Are you sure you want to delete this Permission?',
            () {
              getIt.get<DeletePermissionCubit>().deletePermission(
                    permissionData.id.toString(),
                  );
              GoRouter.of(context).pop();
              Future.delayed(const Duration(milliseconds: 500), () {
                GoRouter.of(context).pushReplacement(
                    AppRouter.kGetPermissionOfSpecificEmployeeView,
                    extra: title);
              });
            },
          );
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
