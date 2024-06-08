import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/hr_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllSupplierView extends StatelessWidget {
  const GetAllSupplierView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: DrawerWidget(
          drawerItemListView: title == "hr"
              ? const HrDrawerItemListView()
              : const ScmDrawerItemListView(),
        ),
        backgroundColor: Colors.white,
        body: SupllierViewBody(scaffoldKey: scaffoldKey),
        floatingActionButton: userRole == "HREmployee" || userRole == "HRAdmin"
            ? CustomFloatingActionButton(
                ctxt: context,
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kAddSupplier,
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
