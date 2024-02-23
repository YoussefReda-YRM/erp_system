import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:erp_system/features/scm/inventory_order/ui/widgets/order_scm_item.dart';
import 'package:flutter/material.dart';

class GetAllInventoryOrdersViewBody extends StatelessWidget {
  const GetAllInventoryOrdersViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          scaffoldKey: scaffoldKey,
          title: "Inventory Orders",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          iconTrailing: IconButton(
            icon: const Icon(
              Icons.search_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
            child: CustomAppBody(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const OrderScmItem();
                  },
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
