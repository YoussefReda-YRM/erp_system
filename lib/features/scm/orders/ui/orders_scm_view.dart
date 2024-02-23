import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/scm/orders/ui/widgets/orders_scm_body.dart';
import 'package:flutter/material.dart';

class OrdersScmView extends StatelessWidget {
  OrdersScmView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const DrawerWidget(),
      body: OrdersScmViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
