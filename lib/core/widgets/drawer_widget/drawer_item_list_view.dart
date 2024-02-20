import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
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
      icon: Icons.autorenew_outlined,
    ),
    DrawerItemModel(
      title: 'Inventory Adjustment',
      icon: Icons.trending_up_outlined,
    ),
    DrawerItemModel(
      title: 'Transfers',
      icon: Icons.transfer_within_a_station_outlined,
    ),
    DrawerItemModel(
      title: 'Reporting',
      icon: Icons.report_outlined,
    ),
    DrawerItemModel(
      title: 'Moves History',
      icon: Icons.history_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              child: DrawerItem(
                drawerItemModel: items[index],
                isActive: activeIndex == index,
              ),
              onTap: () {
                if (activeIndex != index) {
                  setState(() {
                    activeIndex = index;
                    if (activeIndex == 0) {
                      GoRouter.of(context).push(AppRouter.kInventoryHomeView);
                    } else if (activeIndex == 1) {
                      GoRouter.of(context).push(AppRouter.kProductView);
                    } else if (activeIndex == 2) {
                      GoRouter.of(context).push(AppRouter.kCategoryView);
                    } else if (activeIndex == 3) {
                      GoRouter.of(context).push(AppRouter.kReplenishmentView);
                    }
                  });
                }
              },
            ),
            index == 2 || index == 5 ? const CustomDivider() : const SizedBox(),
          ],
        );
      },
    );
  }
}
