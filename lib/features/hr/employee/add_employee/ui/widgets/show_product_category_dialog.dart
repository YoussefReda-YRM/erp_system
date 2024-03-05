import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

showProductCategoriesDialog(BuildContext ctxt, Size size) {
  showDialog(
    context: ctxt,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Select Product Category',
          style: Styles.font14BlueSemiBold(ctxt).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: productCategories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<AddProductCubit>(ctxt)
                      .subCategoryIdController
                      .text = productCategories[index];
                  GoRouter.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const Icon(
                      Icons.category_outlined,
                      color: ColorsApp.primaryColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      productCategories[index],
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

List<String> productCategories = [
  'category 1',
  'category 2',
  'category 3',
  'category 4',
  'category 5',
  'category 6',
  'category 7',
  'category 8',
  'category 9',
  'category 10',
  'category 11',
  'category 12',
  'category 13',
  'category 14',
  'category 15',
  'category 16',
  'category 17',
  'category 18',
];
