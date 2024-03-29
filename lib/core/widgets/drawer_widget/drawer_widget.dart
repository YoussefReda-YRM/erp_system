import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
import 'package:erp_system/core/widgets/drawer_widget/active_and_inactive_item.dart/in_active_drawer_item.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:erp_system/core/widgets/drawer_widget/user_info_list_tile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, required this.drawerItemListView});
  final Widget drawerItemListView;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyDrawerClipper(),
      child: Drawer(
        backgroundColor: ColorsApp.primaryColor,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 120,
                color: ColorsApp.primaryColor,
                child: const Center(
                  child: UserInfoListTile(),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomDivider(),
            ),
            widget.drawerItemListView,
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  const CustomDivider(),
                  InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                      title: 'Settings',
                      icon: Icons.settings_outlined,
                    ),
                  ),
                  InActiveDrawerItem(
                    drawerItemModel: DrawerItemModel(
                      title: 'Sign Out',
                      icon: Icons.logout_outlined,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
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
