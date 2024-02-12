import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarProduct extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  final String title;
  final Widget? iconLeading;
  final IconButton? iconTrailing;

  const CustomAppBarProduct({
    super.key,
    this.scaffoldKey,
    required this.title,
    this.iconLeading,
    this.iconTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsApp.primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              leading: iconLeading,
              title: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  style: Styles.font18LightGreyBold(context),
                ),
              ),
              trailing: iconTrailing,
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
