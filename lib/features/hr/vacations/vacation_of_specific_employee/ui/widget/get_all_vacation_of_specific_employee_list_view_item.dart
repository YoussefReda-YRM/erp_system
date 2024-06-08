import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/vacation_of_specific_employee/ui/widget/vacation_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllVacationOfSpecificEmployeeListViewItem extends StatelessWidget {
  const GetAllVacationOfSpecificEmployeeListViewItem(
      {super.key, required this.data, required this.title});
  final GetAllVacationModel data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsVacationView, extra: data);
      },
      child: Card(
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
                    const SizedBox(width: 3),
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
                    ? VacationPopupMenu(data: data, title: title)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
