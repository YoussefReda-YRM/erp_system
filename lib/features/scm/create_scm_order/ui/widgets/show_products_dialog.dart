import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/get_all_product/data/models/product_response.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

showProductsDialog(
  BuildContext ctxt,
  Size size,
  GetAllProductResponse allProduct,
) {
  showDialog(
    context: ctxt,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Select product',
          style: Styles.font14BlueSemiBold(ctxt).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: allProduct.data?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<CreateScmOrderCubit>(ctxt)
                      .productIdController
                      .text = allProduct.data![index].productId.toString();
                  GoRouter.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(
                      Icons.production_quantity_limits_outlined,
                      color: ColorsApp.primaryColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      allProduct.data![index].productName!,
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
