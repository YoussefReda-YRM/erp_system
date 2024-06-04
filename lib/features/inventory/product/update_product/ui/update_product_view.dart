import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_cubit.dart';
import 'package:erp_system/features/inventory/product/update_product/ui/widgets/update_product_bloc_listnere.dart';
import 'package:erp_system/features/inventory/product/update_product/ui/widgets/update_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key, required this.productData});

  final DetailsProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBarApp(
            title: 'Update Product',
            iconLeading: CustomBackButton(),
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
                      UpdateProductForm(
                        productData: productData,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      AppTextButton(
                        backgroundColor: ColorsApp.primaryColor,
                        buttonText: "Save",
                        textStyle: Styles.font16LightGreyMedium(context)
                            .copyWith(fontSize: 13),
                        onPressed: () {
                          validateThenDoUpdateProduct(context, productData.id!);
                        },
                      ),
                      const UpdateProductBlocListener(),
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

void validateThenDoUpdateProduct(BuildContext context, int productId) {
  if (BlocProvider.of<UpdateProductCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<UpdateProductCubit>(context).updateProduct(productId);
  }
}
