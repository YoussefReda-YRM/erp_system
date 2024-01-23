import 'dart:js';

import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

itemModule(String title, String moduleImage) => InkWell(
        onTap: () {
          print(title);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: ColorsApp.moreLightGrey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                moduleImage,
                width:0.8.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                style: Styles.font15DarkBlueMedium,
              )
            ],
          ),
        ),
      );