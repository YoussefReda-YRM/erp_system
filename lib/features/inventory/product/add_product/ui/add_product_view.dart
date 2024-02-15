import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/add_product_bloc_listnere.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/add_product_form.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarProduct(
            title: 'New Product',
            iconLeading: CustomBackButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kProductView);
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      const AddProductForm(),
                      SizedBox(
                        height: 40.h,
                      ),
                      AppTextButton(
                        backgroundColor: ColorsApp.primaryColor,
                        buttonText: "Create",
                        textStyle: Styles.font18LightGreyBold(context),
                        onPressed: () {
                          validateThenDoAddProduct(context);
                        },
                      ),
                      const AddProductBlocListener(),
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

void validateThenDoAddProduct(BuildContext context) {
  if (BlocProvider.of<AddProductCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<AddProductCubit>(context).addProduct();
  }
}
