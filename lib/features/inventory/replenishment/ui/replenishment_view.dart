import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/replenishment_view_body.dart';
import 'package:flutter/material.dart';

class ReplenishmentView extends StatelessWidget {
  ReplenishmentView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      body: ReplenishmentViewBody(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
