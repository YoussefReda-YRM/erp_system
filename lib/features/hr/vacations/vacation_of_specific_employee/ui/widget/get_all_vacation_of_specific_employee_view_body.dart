import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/vacations/vacation_of_specific_employee/ui/widget/get_all_vacation_of_specific_employee_list_view.dart';
import 'package:flutter/material.dart';

class GetAllVacationOfSpecificEmployeeViewBody extends StatelessWidget {
  const GetAllVacationOfSpecificEmployeeViewBody(
      {super.key, required this.scaffoldKey, required this.title});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "My Vacations",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        Expanded(
          child: CustomAppBody(
            child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: GetAllVacationOfSpecificEmployeeListView(
                  title: title,
                )),
          ),
        ),
      ],
    );
  }
}
