import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_item_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HrDrawerItemListView extends StatefulWidget {
  const HrDrawerItemListView({
    super.key,
  });

  @override
  State<HrDrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<HrDrawerItemListView> {
  final List<DrawerItemModel> items = [
    DrawerItemModel(
      title: 'Employees',
      icon: Icons.person_outline,
    ),
    DrawerItemModel(
      title: 'Departments',
      icon: Icons.business_outlined,
    ),
    DrawerItemModel(
      title: 'Attendance',
      icon: Icons.access_time_outlined,
    ),
    DrawerItemModel(
      title: 'Vacations',
      icon: Icons.description_outlined,
    ),
    DrawerItemModel(
      title: 'My Vacations',
      icon: Icons.description_outlined,
    ),
    DrawerItemModel(
      title: 'Permissions',
      icon: Icons.description_outlined,
    ),
    DrawerItemModel(
      title: 'My Permissions',
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
                      GoRouter.of(context).push(AppRouter.kAllEmployeesView);
                    } else if (activeIndex == 1) {
                      GoRouter.of(context).push(AppRouter.kAllDepartmentsView);
                    } else if (activeIndex == 2) {
                      GoRouter.of(context).push(AppRouter.kAttendanceView);
                    } else if (activeIndex == 3) {
                      GoRouter.of(context).push(AppRouter.kGetAllVacationsView);
                    }
                    else if (activeIndex == 4) {
                      GoRouter.of(context).push(AppRouter.kGetAllVacationOfSpecificEmployeeView);
                    }
                     else if (activeIndex == 5) {
                     GoRouter.of(context).push(AppRouter.kGetAllPermissionView);
                     }
                    else if (activeIndex == 6) {
                      GoRouter.of(context).push(AppRouter.kGetPermissionOfSpecificEmployeeView);
                    }
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}
