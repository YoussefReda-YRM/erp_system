import 'package:erp_system/core/widgets/drawer_widget/accounting_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_accounting_view_body.dart';
import 'package:flutter/material.dart';

class GetAllSupplierAccounting extends StatelessWidget {
  const GetAllSupplierAccounting({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(
          drawerItemListView: AccountingDrawerItemListView(),
        ),
        backgroundColor: Colors.white,
        body: SupplierAccountingViewBody(scaffoldKey: scaffoldKey),
        //  floatingActionButton: const AddSubCategoryFloatingActionButton(),
      ),
    );
  }
}
