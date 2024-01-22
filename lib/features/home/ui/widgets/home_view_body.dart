import 'package:erp_system/features/home/ui/widgets/custom_app_bar.dart';
import 'package:erp_system/features/home/ui/widgets/items_modules.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children:const [
          CustomAppBarHomeScreen(),
          ItemsModules()
        ],
      ),
    );
  }
}

