import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';

class ReorderViewBody extends StatelessWidget {
  const ReorderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          title: "Re-order",
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
          child: CustomAppBody(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Re-order the T-shirt",
                    style: Styles.font18DarkBlueBold(context)
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: ColorsApp.primaryColor),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    hintText: 'Enter The Quantity',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorsApp.primaryColor,
                                        width: 1.3,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    validator: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppTextFormField(
                                    hintText: 'Enter The Refernce',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorsApp.primaryColor,
                                        width: 1.3,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    validator: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppTextFormField(
                                    hintText: 'Enter The Employee ID',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorsApp.primaryColor,
                                        width: 1.3,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    validator: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppTextFormField(
                                    hintText: 'Enter The Accounting ID',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorsApp.primaryColor,
                                        width: 1.3,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    validator: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  AppTextButton(
                                    buttonText: "Re-order",
                                    backgroundColor: const Color(0xff51CC5D),
                                    textStyle:
                                        Styles.font16LightGreyMedium(context)
                                            .copyWith(
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
