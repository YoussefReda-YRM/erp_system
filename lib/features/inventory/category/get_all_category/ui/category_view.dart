import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/inventory_drawer_item_list_view.dart';
import 'package:erp_system/features/inventory/category/add_category/ui/widgets/add_sub_category_floating_action_button.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/widgets/category_view_body.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerWidget(
          drawerItemListView: InventoryDrawerItemListView(),
        ),
        backgroundColor: Colors.white,
        body: CategoryViewBody(scaffoldKey: scaffoldKey),
        floatingActionButton: userRole == "InventoryEmployee"
            ? const AddSubCategoryFloatingActionButton()
            : const SizedBox(),
      ),
    );
  }
}
