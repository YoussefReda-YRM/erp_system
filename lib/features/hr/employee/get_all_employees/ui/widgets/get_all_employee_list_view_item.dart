import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllEmployeeListViewItem extends StatelessWidget {
  const GetAllEmployeeListViewItem({
    super.key,
    required this.employeeData,
  });

  final EmployeeData employeeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kDetailsEmployeeView,
          extra: employeeData.userId.toString(),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                AssetsData.profile,
              ),
            ),
            title: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                employeeData.name.toString(),
                style: Styles.font18DarkBlueBold(context),
              ),
            ),
            subtitle: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                employeeData.email.toString(),
                style: Styles.font14BlueSemiBold(context),
              ),
            ),
            trailing: CustomPopupMenuButton(
              employeeData: employeeData,
            ),
          ),
        ),
      ),
    );
  }
}
