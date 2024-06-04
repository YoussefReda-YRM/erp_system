import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SupplierListViewBody extends StatelessWidget {
  SupplierListViewBody(this.response, {super.key});
  GetAllSupplierResponse response = GetAllSupplierResponse();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: response.count,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kSupplierDetails,
                extra: {
                  "supplierName": response.data![index].supplierName,
                  "supplierEmail": response.data![index].supplierEmail,
                  "supplierPhone": response.data![index].supplierPhone,
                  "addedBy": response.data![index].addedBy,
                  "id": response.data![index].id,
                },
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Supplier Name: ${response.data![index].supplierName}",
                          style: Styles.font16DarkBlueBold(context)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Email: ${response.data![index].supplierEmail}",
                          style: Styles.font13BlueSemiBold(context)),
                    ]),
              ),
            ),
          );
        });
  }
}
