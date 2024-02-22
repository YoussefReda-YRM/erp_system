import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/widgets/details_product_view_body.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';

class DetailsProductView extends StatelessWidget {
  const DetailsProductView({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarProduct(
            title: "Details Product",
            iconLeading: const CustomBackButton(),
            iconTrailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 34,
                color: ColorsApp.lightGrey,
              ),
            ),
          ),
          Expanded(
            child: CustomAppBody(
              child: DetailsProductViewBody(
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
