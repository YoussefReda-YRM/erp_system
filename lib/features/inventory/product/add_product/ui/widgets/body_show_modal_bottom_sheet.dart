import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BodyShowModalBottomSheet extends StatelessWidget {
  const BodyShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: AbsorbPointer(
        absorbing: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsApp.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Create Product",
                style: Styles.font18LightGreyBold.copyWith(color: Colors.pink),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AddProductForm(),
                      const SizedBox(
                        height: 30,
                      ),
                      AppTextButton(
                        buttonText: 'Create',
                        textStyle: Styles.font16LightGreyMedium,
                        backgroundColor: ColorsApp.primaryColor,
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.kDetailsProductView);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
