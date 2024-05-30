import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/ui/widget/get_all_taxes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllTaxesView extends StatefulWidget {
  const GetAllTaxesView({super.key});

  @override
  State<GetAllTaxesView> createState() => _GetAllTaxesViewState();
}

class _GetAllTaxesViewState extends State<GetAllTaxesView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: AccountingDrawerItemListView(),
      ),
      body: GetAllTaxesViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: CustomFloatingActionButton(
        ctxt: context,
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddTaxes);
        },
      ),

    );
  }
}
