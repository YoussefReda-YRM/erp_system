import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/auth/login/data/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarHomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomAppBarHomeView({
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
                getIt.get<LoginResponse>().userData!.userName!,
                maxLines: 1,
                style: Styles.font18LightGreyBold(context),
              ),
              subtitle: getIt.get<LoginResponse>().userData!.role == null
                  ? Text(
                      "There is no role",
                      style: Styles.font14LightGreyRegular(context),
                    )
                  : Text(
                      getIt.get<LoginResponse>().userData!.role.toString(),
                      style: Styles.font14LightGreyRegular(context),
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
