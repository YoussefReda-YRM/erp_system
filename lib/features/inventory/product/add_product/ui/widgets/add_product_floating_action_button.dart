import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddProductFloatingActionButton extends StatelessWidget {
  const AddProductFloatingActionButton({super.key, required this.ctxt});
  final BuildContext ctxt;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.primaryColor,
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kAddProductView);
      },
      child: Text(
        "New",
        style: Styles.font13LightGreyRegular(context),
      ),
    );
  }
}
