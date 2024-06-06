import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/accounting/get_all_invoices/ui/widgets/get_all_invoices_list_view.dart';
import 'package:flutter/material.dart';

class GetAllInvoicesViewBody extends StatelessWidget {
  const GetAllInvoicesViewBody({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          title: 'All Invoices',
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
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GetAllInvoicesListView(),
              ],
            ),
          )),
        )
      ],
    );
  }
}
