import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/features/modules/ui/widgets/custom_app_bar.dart';
import 'package:erp_system/features/modules/ui/widgets/item_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarModulesScreen(),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
            ),
            child: Column(
              children: [
                itemModule('All Product: 100', AssetsData.product),
                SizedBox(height: 20.h,),
                itemModule('Replienshment: 24', AssetsData.replensh),
              ],
            )),
      ],
    );
  }
}
