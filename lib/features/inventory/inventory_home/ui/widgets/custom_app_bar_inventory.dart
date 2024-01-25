import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarInventory extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBarInventory({
    super.key,
    required this.scaffoldKey,
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
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 34,
                  color: ColorsApp.lightGrey,
                ),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              title: Text(
                'Youssef Reda Mohamed',
                maxLines: 1,
                style: Styles.font18LightGreyBold,
              ),
              subtitle: Text(
                'inventory employee',
                style: Styles.font14LightGreyRegular,
              ),
              trailing: const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  AssetsData.profile,
                ),
              ),
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
