import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

customCardInventory(BuildContext context, String title, String moduleImage) => InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kLoginView);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                moduleImage,
                width: 80,
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Text(
                  title,
                  style: Styles.font10BlueSemiBold(context),
                ),
              )
            ],
          ),
        ),
      ),
    );