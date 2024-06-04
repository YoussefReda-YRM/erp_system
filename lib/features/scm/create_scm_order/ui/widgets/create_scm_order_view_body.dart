import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/scm/create_scm_order/ui/widgets/create_scm_order_form.dart';
import 'package:flutter/material.dart';

class CreateScmOrderViewBody extends StatelessWidget {
  const CreateScmOrderViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          title: "Create SCM Order",
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
            child: SizedBox(
              width: double.infinity,
              child: CreateScmOrderViewBodyForm(),
            ),
          ),
        ),
      ],
    );
  }
}
