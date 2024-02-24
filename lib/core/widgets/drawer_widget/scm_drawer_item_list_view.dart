import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScmDrawerItemListView extends StatefulWidget {
  const ScmDrawerItemListView({
    super.key,
  });

  @override
  State<ScmDrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<ScmDrawerItemListView> {
  final List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Home',
      icon: Icons.home_outlined,
    ),
    DrawerItemModel(
      title: 'Inventory Orders',
      icon: Icons.shopping_cart_outlined,
    ),
    DrawerItemModel(
      title: 'Finished Orders',
      icon: Icons.check_circle_outlined,
    ),
    DrawerItemModel(
      title: 'All Orders',
      icon: Icons.list_alt_outlined,
    ),
    DrawerItemModel(
      title: 'Create Orders',
      icon: Icons.add_outlined,
    ),
    DrawerItemModel(
      title: 'Suppliers',
      icon: Icons.store_outlined,
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
                      GoRouter.of(context).push(AppRouter.kScmHomeView);
                    } else if (activeIndex == 1) {
                      GoRouter.of(context).push(AppRouter.kInventoryOrders);
                    }else if(activeIndex==5){
                      GoRouter.of(context).push(AppRouter.kSupplierView);
                    }
                  });
                }
              },
            ),
            index == 4 ? const CustomDivider() : const SizedBox(),
          ],
        );
      },
    );
  }
}
