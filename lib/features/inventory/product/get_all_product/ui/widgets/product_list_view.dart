import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductCubit, GetAllProductState>(
      builder: (context, state) {
        if (state is GetAllProductSuccess) {
          return Expanded(
            child: Container(
              color: ColorsApp.primaryColor,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildDataTable(state.response),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GetAllProductFailure) {
          // setupErrorState(context, state.error.toString());
          return const Text("Failure...");
        } else if (state is GetAllProductLoading) {
          // customErrorIndicator(context);
          return const Center(child: CircularProgressIndicator());
        } else { 
          return const Center(child: Text("Unknown Error"));
        }
      },
    );
  }
}

Widget buildDataTable(GetAllProductResponse products) {
  final columns = ['Name', 'Category', 'On Hand'];
  return DataTable(
    columns: getColumns(columns),
    rows: getRows(products.data!),
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

List<DataRow> getRows(List<ProductData> products) => products
    // Use asMap to get both the element and index
    .map(
      (ProductData product) => DataRow(
        cells: [
          DataCell(
            Center(
              child: Text(
                '${product.productName}',
                style: Styles.font10BlueSemiBold,
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                '${product.category}',
                style: Styles.font10BlueSemiBold,
              ),
            ),
          ),
          DataCell(
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
