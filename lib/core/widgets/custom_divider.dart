import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const Divider(
        thickness: 0.4,
        color: ColorsApp.lightGrey,
      ),
    );
  }
}
