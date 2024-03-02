import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/ui/widgets/get_all_employee_list_view_item.dart';
import 'package:flutter/material.dart';

class GetAllEmployeeViewBody extends StatelessWidget {
  const GetAllEmployeeViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Employees",
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
          iconTrailing: IconButton(
            icon: const Icon(
              Icons.search_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: CustomAppBody(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GetAllEmployeeListViewItem(
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
