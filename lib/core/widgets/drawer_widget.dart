import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
import 'package:erp_system/core/widgets/custom_item_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyDrawerClipper(),
      child: Drawer(
        backgroundColor: ColorsApp.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              color: ColorsApp.primaryColor,
              child: Center(
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      AssetsData.profile,
                    ),
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
                  onTap: () {},
                ),
              ),
            ),
            const CustomDivider(),
            CustomItemDrawer(
              leading: const Icon(
                Icons.production_quantity_limits_outlined,
                color: ColorsApp.lightGrey,
              ),
              title: 'Products',
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.kProductView);
              },
            ),
            CustomItemDrawer(
              leading: const Icon(
                Icons.category_outlined,
                color: ColorsApp.lightGrey,
              ),
              title: 'Categories',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            CustomItemDrawer(
              leading: const Icon(
                Icons.reorder_outlined,
                color: ColorsApp.lightGrey,
              ),
              title: 'Replenishments',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            CustomItemDrawer(
              leading: const Icon(
                Icons.transfer_within_a_station_outlined,
                color: ColorsApp.lightGrey,
              ),
              title: 'Transfers',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomDivider(),
            CustomItemDrawer(
              leading: const Icon(
                Icons.settings_outlined,
                color: ColorsApp.lightGrey,
              ),
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            CustomItemDrawer(
              title: "Sign Out",
              leading: const Icon(
                Icons.logout_outlined,
                color: ColorsApp.lightGrey,
              ),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the Drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 40, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
