import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarModulesScreen extends StatelessWidget {
  const CustomAppBarModulesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title: Text(
              'Hi!',
              style: Styles.font24LightGreyBold(context),
            ),
            subtitle: Text(
              'Good Morning',
              style: Styles.font16LightGreyMedium(context),
            ),
            trailing: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                AssetsData.logo,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
