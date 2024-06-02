import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/data/models/get_all_accounting_employee.dart';
import 'package:erp_system/features/inventory/orders/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

showAccountingEmployeeDialog(
  BuildContext ctxt,
  Size size,
  List<GetAllAccountingEmployeeModel> allAccountingEmp,
  dynamic cubit,
) {
  showDialog(
    context: ctxt,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Select accounting employee',
          style: Styles.font14BlueSemiBold(ctxt).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allAccountingEmp.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (cubit is UpdateOrderCubit) {
                    cubit.accEmployeeIdController.text =
                        allAccountingEmp[index].userID.toString();
                  } else if (cubit is ReOrderCubit) {
                    cubit.accEmployeeIdController.text =
                        allAccountingEmp[index].userID.toString();
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
                      allAccountingEmp[index].userName!,
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
