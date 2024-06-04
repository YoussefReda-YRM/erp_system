import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/create_scm_order/ui/widgets/create_scm_order_view_body.dart';
import 'package:flutter/material.dart';

class CreateScmOrderView extends StatefulWidget {
  const CreateScmOrderView({super.key});

  @override
  State<CreateScmOrderView> createState() => _CreateScmOrderViewState();
}

class _CreateScmOrderViewState extends State<CreateScmOrderView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(
        drawerItemListView: ScmDrawerItemListView(),
      ),
      backgroundColor: Colors.white,
      body: CreateScmOrderViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
