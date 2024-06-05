import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/logic/get_all_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.employeeData,
  });
  final EmployeeData employeeData;

  @override
  Widget build(BuildContext context) {
    if (userRole == "HRAdmin" || userRole == "HREmployee") {
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
              AppRouter.kUpdateEmployeeView,
              extra: employeeData,
            );
          } else if (value == 'delete') {
            deleteShowDialog(
              context,
              'Are you sure you want to delete this Employee?',
              () {
                getIt.get<GetAllEmployeeCubit>().deleteEmployee(
                      employeeData.userId.toString(),
                    );
                GoRouter.of(context).pop();
                Future.delayed(const Duration(milliseconds: 200), () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kAllEmployeesView);
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
    } else {
      return const SizedBox();
    }
  }
}
