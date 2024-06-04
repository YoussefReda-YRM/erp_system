import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/scm_drawer_item_list_view.dart';
import 'package:erp_system/features/scm/get_all_status_of_scm_order/ui/widgets/get_all_status_of_scm_view_body.dart';
import 'package:flutter/material.dart';

class GetAllScmOrderStatusView extends StatefulWidget {
  const GetAllScmOrderStatusView({super.key});

  @override
  State<GetAllScmOrderStatusView> createState() =>
      _GetAllScmOrderStatusViewState();
}

class _GetAllScmOrderStatusViewState extends State<GetAllScmOrderStatusView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(
        drawerItemListView: ScmDrawerItemListView(),
      ),
      body: GetAllStatusOfScmViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
