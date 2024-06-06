import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/accounting/get_all_invoices/ui/widgets/get_all_invoices_view_boyd.dart';
import 'package:flutter/material.dart';

class GetAllInvoicesView extends StatefulWidget {
  const GetAllInvoicesView({
    super.key,
  });

  @override
  State<GetAllInvoicesView> createState() => _GetAllInvoicesViewState();
}

class _GetAllInvoicesViewState extends State<GetAllInvoicesView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: GetAllInvoicesViewBody(
          scaffoldKey: scaffoldKey,
        ),
        drawer: const DrawerWidget(
          drawerItemListView: AccountingDrawerItemListView(),
        ),
      ),
    );
  }
}
