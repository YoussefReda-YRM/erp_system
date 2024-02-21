import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetAllSupplierView extends StatelessWidget {
  const GetAllSupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(),
        backgroundColor: Colors.white,
        body: SupllierViewBody(scaffoldKey: scaffoldKey),
      //  floatingActionButton: const AddSubCategoryFloatingActionButton(),
      ),
    );
  }
}
