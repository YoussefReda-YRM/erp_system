import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/inventory/product/details_product/ui/widgets/details_product_view_body.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:flutter/material.dart';

class DetailsProductView extends StatelessWidget {
  const DetailsProductView({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBarApp(
            title: "Details Product",
            iconLeading: CustomBackButton(),
          ),
          Expanded(
            child: CustomAppBody(
              child: DetailsProductViewBody(
                size: size,
                productId: productId,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
