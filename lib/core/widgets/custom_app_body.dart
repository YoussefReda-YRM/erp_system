import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CustomAppBody extends StatelessWidget {
  const CustomAppBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
        ),
        child: child,
      ),
    );
  }
}
