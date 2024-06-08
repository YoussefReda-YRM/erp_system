import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_cubit.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

showSupplierDialog(
  BuildContext ctxt,
  Size size,
  GetAllSupplierResponse allSupplier,
  dynamic cubit,
) {
  showDialog(
    context: ctxt,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Select Suppier',
          style: Styles.font14BlueSemiBold(ctxt).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allSupplier.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (cubit is UpdateOrderCubit) {
                    cubit.accEmployeeIdController.text =
                        allSupplier.data![index].id.toString();
                  } else if (cubit is ReOrderCubit) {
                    cubit.supplierIdController.text =
                        allSupplier.data![index].id.toString();

                    cubit.supplierNameController.text =
                        allSupplier.data![index].supplierName.toString();
                  } else if (cubit is CreateScmOrderCubit) {
                    cubit.supplierIdController.text =
                        allSupplier.data![index].id.toString();
                    cubit.supplierNameController.text =
                        allSupplier.data![index].supplierName.toString();
                  }
                  GoRouter.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(
                      Icons.person_outlined,
                      color: ColorsApp.primaryColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      allSupplier.data![index].supplierName!,
                      style: Styles.font13BlueSemiBold(context)
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(ctxt).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.pink),
            ),
          )
        ],
      );
    },
  );
}
