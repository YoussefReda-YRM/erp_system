import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/replenishment_item.dart';
import 'package:flutter/material.dart';

class ReplenishmentViewBody extends StatelessWidget {
  const ReplenishmentViewBody({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          scaffoldKey: scaffoldKey,
          title: "Replenishments",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "4 items",
                  style:
                      Styles.font18DarkBlueBold(context).copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ReplenishmentItem();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
