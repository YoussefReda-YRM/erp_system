import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/widgets/drawer_widget/drawer_widget.dart';
import 'package:erp_system/core/widgets/drawer_widget/inventory_drawer_item_list_view.dart';
import 'package:erp_system/core/widgets/custom_floating_action_button.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/get_all_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetAllProductView extends StatefulWidget {
  const GetAllProductView({super.key});

  @override
  State<GetAllProductView> createState() => _GetAllProductViewState();
}

class _GetAllProductViewState extends State<GetAllProductView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: const DrawerWidget(
        drawerItemListView: InventoryDrawerItemListView(),
      ),
      body: GetAllProductViewBody(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: CustomFloatingActionButton(
        ctxt: context,
        onPressed: () {
          
          GoRouter.of(context).push(
            AppRouter.kAddProductView,
          );
        },
      ),
    );
  }
}
