import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/features/scm/scm_home/ui/widgets/scm_home_view_body.dart';
import 'package:flutter/material.dart';

class ScmHomeView extends StatelessWidget {
  ScmHomeView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: ScmHomeViewBody(
        scaffoldKey: scaffoldKey,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
