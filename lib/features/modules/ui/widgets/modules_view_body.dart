import 'package:erp_system/features/modules/ui/widgets/custom_app_bar.dart';
import 'package:erp_system/features/modules/ui/widgets/items_modules.dart';
import 'package:flutter/material.dart';

class ModulesViewBody extends StatelessWidget {
  const ModulesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children:const [
          CustomAppBarModulesScreen(),
          ItemsModules()
        ],
      ),
    );
  }
}

