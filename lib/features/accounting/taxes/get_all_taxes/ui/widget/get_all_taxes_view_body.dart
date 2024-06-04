import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/ui/widget/get_all_taxes_list_view.dart';
import 'package:flutter/material.dart';

class GetAllTaxesViewBody extends StatelessWidget {
  const GetAllTaxesViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Taxes",
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
                child: GetAllTaxesListView()),
          ),
        ),
      ],
    );
  }
}
