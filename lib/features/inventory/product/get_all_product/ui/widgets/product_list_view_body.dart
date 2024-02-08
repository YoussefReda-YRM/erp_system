import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget buildDataTable(GetAllProductResponse products, BuildContext context) {
  final columns = ['Name', 'Category', 'On Hand'];
  return DataTable(
    columns: getColumns(columns),
    rows: getRows(products.data!, context),
  );
}

List<DataColumn> getColumns(List<String> columnsName) => columnsName
    .map(
      (String columnName) => DataColumn(
        label: Text(
          columnName,
          style: Styles.font15DarkBlueMedium,
        ),
      ),
    )
    .toList();

List<DataRow> getRows(List<ProductData> products, BuildContext context) =>
    products
        // Use asMap to get both the element and index
        .map(
          (ProductData product) => DataRow(
            cells: [
              DataCell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetailsProductView);
                },
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Center(
                    child: Text(
                      '${product.productName}',
                      style: Styles.font10BlueSemiBold,
                    ),
                  ),
                ),
              ),
              DataCell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetailsProductView);
                },
                Center(
                  child: Text(
                    '${product.category}',
                    style: Styles.font10BlueSemiBold,
                  ),
                ),
              ),
              DataCell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetailsProductView);
                },
                Center(
                  child: Text(
                    '${product.productOnHand}',
                    style: Styles.font10BlueSemiBold,
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();
