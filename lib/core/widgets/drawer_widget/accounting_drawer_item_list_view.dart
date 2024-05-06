import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/custom_divider.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountingDrawerItemListView extends StatefulWidget {
  const AccountingDrawerItemListView({
    super.key,
  });

  @override
  State<AccountingDrawerItemListView> createState() =>
      _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<AccountingDrawerItemListView> {
  final List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Main',
      icon: Icons.home_outlined,
    ),
    DrawerItemModel(
      title: 'SCM Orders',
      icon: Icons.shopping_cart_checkout_outlined,
    ),
    DrawerItemModel(
      title: 'Inventory Orders',
      icon: Icons.shopping_cart_checkout_outlined,
    ),
    DrawerItemModel(
      title: 'Bills',
      icon: Icons.receipt_outlined,
    ),
    DrawerItemModel(
      title: 'All Suppliers',
      icon: Icons.business_outlined,
    ),
    DrawerItemModel(
      title: 'Taxes',
      icon: Icons.monetization_on_outlined,
    ),
    DrawerItemModel(
      title: 'Profit & Loss',
      icon: Icons.trending_up_outlined,
    ),
    DrawerItemModel(
      title: 'Tax Report',
      icon: Icons.description_outlined,
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
                      // GoRouter.of(context).push(AppRouter.kAllEmployeesView);
                    } else if (activeIndex == 1) {
                      GoRouter.of(context).push(AppRouter.kGetAllScmOrdersView);
                    } else if (activeIndex == 2) {
                      // GoRouter.of(context).push(AppRouter.kAttendanceView);
                    } else if (activeIndex == 3) {
                      // GoRouter.of(context).push(AppRouter.kGetAllVacationsView);
                    } else if (activeIndex == 4) {
                      // GoRouter.of(context).push(AppRouter.kGetAllVacationOfSpecificEmployeeView);
                    } else if (activeIndex == 5) {
                      //  GoRouter.of(context).push(AppRouter.kGetAllPermissionView);
                    } else if (activeIndex == 6) {
                      // GoRouter.of(context).push(AppRouter.kGetPermissionOfSpecificEmployeeView);
                    }
                  });
                }
              },
            ),
            index == 0 || index == 4 || index == 5 || index == 8
                ? const CustomDivider()
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
