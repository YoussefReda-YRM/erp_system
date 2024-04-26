import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/ui/widget/get_all_permission_list_view.dart';
import 'package:flutter/material.dart';

class GetAllVacationViewBody extends StatelessWidget {
  const GetAllVacationViewBody({super.key,required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Permissions",
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
        const Expanded(
          child: CustomAppBody(
            child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: GetAllPermissionListView()),
          ),
        ),
      ],
    );
  }
}
