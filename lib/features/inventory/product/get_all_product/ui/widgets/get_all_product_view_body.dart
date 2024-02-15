import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/product_list_view.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';

class GetAllProductViewBody extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const GetAllProductViewBody({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          scaffoldKey: scaffoldKey,
          title: "All Products",
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
        const Expanded(child: ProductListView()),
      ],
    );
  }
}
