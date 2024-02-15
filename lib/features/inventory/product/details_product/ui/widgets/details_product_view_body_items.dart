import 'package:barcode_widget/barcode_widget.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:flutter/material.dart';

class DetailsProductViewBodyItems extends StatelessWidget {
  const DetailsProductViewBodyItems({
    super.key,
    required this.detailsProductModel,
  });

  final DetailsProductModel detailsProductModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Product Name: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              detailsProductModel.productName!,
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Category Name: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              detailsProductModel.category!,
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "On Hand: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              detailsProductModel.productOnHand.toString(),
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "In Coming: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              detailsProductModel.productInComing.toString(),
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Out Going: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              detailsProductModel.productOutGoing.toString(),
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Cost Price: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              "${detailsProductModel.productCostPrice.toString()} \$",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Sell Price: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            Text(
              "${detailsProductModel.productSellPrice.toString()} \$",
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Barcode: ",
              style: Styles.font13BlueSemiBold(context),
            ),
            const Spacer(),
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: detailsProductModel.productBarcode!,
              width: 100,
              height: 100,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
