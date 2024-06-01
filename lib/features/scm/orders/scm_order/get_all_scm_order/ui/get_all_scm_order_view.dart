import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/ui/widget/get_all_scm_order_view_body.dart';
import 'package:flutter/material.dart';

class GetAllScmOrderView extends StatefulWidget {
  const GetAllScmOrderView({super.key});

  @override
  State<GetAllScmOrderView> createState() => _GetAllTaxesViewState();
}

class _GetAllTaxesViewState extends State<GetAllScmOrderView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: ScmDrawerItemListView(),
      ),
      body: GetAllScmOrderViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: CustomFloatingActionButton(
        ctxt: context,
        onPressed: () {
          //GoRouter.of(context).push(AppRouter.kAddTaxes);
        },
      ),
    );
  }
}
