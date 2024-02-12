import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?? () {
        GoRouter.of(context).pop();
      },
      child: Container(
        width: 41,
        height: 41,
        decoration: ShapeDecoration(
          color: ColorsApp.moreLightGrey,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFE8ECF4)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Image.asset(AssetsData.backArrow),
      ),
    );
  }
}
