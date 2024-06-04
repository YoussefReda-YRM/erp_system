import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllSupplierView extends StatelessWidget {
  const GetAllSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(
          drawerItemListView: ScmDrawerItemListView(),
        ),
        backgroundColor: Colors.white,
        body: SupllierViewBody(scaffoldKey: scaffoldKey),
        floatingActionButton: CustomFloatingActionButton(
          ctxt: context,
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.kAddSupplier,
            );
          },
        ),
      ),
    );
  }
}
