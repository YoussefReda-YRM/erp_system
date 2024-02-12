import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerItemListView extends StatefulWidget {
  const DrawerItemListView({
    super.key,
  });

  @override
  State<DrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<DrawerItemListView> {
  final List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Home',
      icon: Icons.home_outlined,
    ),
    DrawerItemModel(
      title: 'Products',
      icon: Icons.production_quantity_limits_outlined,
    ),
    DrawerItemModel(
      title: 'Categories',
      icon: Icons.category_outlined,
    ),
    DrawerItemModel(
      title: 'Replenishments',
      icon: Icons.reorder_outlined,
    ),
    DrawerItemModel(
      title: 'Transfers',
      icon: Icons.transfer_within_a_station_outlined,
    ),
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: DrawerItem(
            drawerItemModel: items[index],
            isActive: activeIndex == index,
          ),
          onTap: () {
            // if i want to work a switch loop i did it
            if (index == 1) {
              GoRouter.of(context).push(AppRouter.kProductView);
            }
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
          },
        );
      },
    );
  }
}
