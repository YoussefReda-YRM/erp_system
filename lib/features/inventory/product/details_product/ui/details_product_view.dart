import 'package:barcode_widget/barcode_widget.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:erp_system/features/inventory/product/widgets/delete_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DetailsProductView extends StatelessWidget {
  const DetailsProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarProduct(
            title: "Details Product",
            iconLeading: const CustomBackButton(),
            iconTrailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 34,
                color: ColorsApp.lightGrey,
              ),
            ),
          ),
          Expanded(
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(color: ColorsApp.primaryColor),
                          ),
                          color: Colors.white,
                          child: SizedBox(
                            height: 400,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Product Name: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "Category Name: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "On Hand: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "In Coming: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "Out Going: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "Cost Price: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "Sale Price: ",
                                              style: Styles.font13BlueSemiBold,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "T-shirt",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "Clothes",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "65",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "30",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "35",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "130",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "160",
                                              style: Styles.font13BlueSemiBold.copyWith(color: Colors.pink),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Center(
                                      child: BarcodeWidget(
                                        barcode: Barcode.qrCode(),
                                        data: "Hello World",
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppTextButton(
                            buttonText: "Edit",
                            width: 150,
                            backgroundColor: Colors.green,
                            textStyle: Styles.font13BlueSemiBold,
                            onPressed: () {
                              showEditProductDialog(context, size);
                            },
                          ),
                          const Spacer(),
                          AppTextButton(
                            buttonText: "Delete",
                            width: 150,
                            backgroundColor: Colors.red,
                            textStyle: Styles.font13BlueSemiBold,
                            onPressed: () {
                              deleteShowDialog(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showEditProductDialog(BuildContext context, Size size) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Edit Product',
          style: Styles.font14BlueSemiBold.copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'product name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'cateogry name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'on hand',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'in come',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'out going',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'cost price',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'sale price',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextButton(
                  buttonText: "Save",
                  backgroundColor: ColorsApp.primaryColor,
                  textStyle: Styles.font13LightGreyRegular,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
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
