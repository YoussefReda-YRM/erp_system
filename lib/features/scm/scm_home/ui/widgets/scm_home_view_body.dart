import 'package:erp_system/core/widgets/custom_app_bar_home_view.dart';
import 'package:erp_system/features/scm/scm_home/ui/widgets/list_of_card_scm.dart';
import 'package:flutter/material.dart';

class ScmHomeViewBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const ScmHomeViewBody({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarHomeView(scaffoldKey: scaffoldKey),
        const ListOfCardScm(),
      ],
    );
  }
}
