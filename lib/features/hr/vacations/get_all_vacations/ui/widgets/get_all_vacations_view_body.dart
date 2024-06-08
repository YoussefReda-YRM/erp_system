import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/ui/widgets/get_all_vacations_list_view.dart';
import 'package:flutter/material.dart';

class GetAllVacationsViewBody extends StatelessWidget {
  const GetAllVacationsViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Vacations",
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
        const Expanded(
          child: CustomAppBody(
            child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: GetAllVacationsListView()),
          ),
        ),
      ],
    );
  }
}
