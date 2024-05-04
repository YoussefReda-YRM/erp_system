import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {super.key, required this.ctxt, this.onPressed});
  final BuildContext ctxt;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.primaryColor,
      onPressed: onPressed,
      child: Text(
        "New",
        style: Styles.font13LightGreyRegular(context),
      ),
    );
  }
}
