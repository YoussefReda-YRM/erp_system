import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

itemModule(BuildContext context, String title, String moduleImage) => InkWell(
      onTap: () {
        if (title == "SCM") {
          GoRouter.of(context).go(AppRouter.kScmHomeView);
        } else if (title == "HR") {
          GoRouter.of(context).go(AppRouter.kAllEmployeesView);
        } else if (title == "Inventory") {
          GoRouter.of(context).go(AppRouter.kInventoryHomeView);
        } else if (title == "Accounting") {
          GoRouter.of(context)
              .go(AppRouter.kGetAllScmOrdersView, extra: 'accounting');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: ColorsApp.primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              moduleImage,
              width: 50,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Styles.font15DarkBlueMedium(context),
            )
          ],
        ),
      ),
    );
