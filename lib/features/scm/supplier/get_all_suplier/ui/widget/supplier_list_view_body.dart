import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorsApp.border,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(response.data![index].supplierName ?? "none",
                        style: Styles.font24BlackBold(context)),
                    Text(response.data![index].supplierEmail ?? "none",
                        style: Styles.font18LightGreyBold(context)),
                  ]),
            ),
          );
        });
  }
}
