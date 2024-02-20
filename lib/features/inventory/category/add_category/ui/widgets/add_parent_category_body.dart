import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/add_category/ui/widgets/add_parent_category_bloc_listner.dart';
import 'package:erp_system/features/inventory/category/add_category/ui/widgets/add_parent_category_form.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddParentCategoryBody extends StatelessWidget {
  const AddParentCategoryBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          title: 'Add parent Category',
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.transparent),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: AddParentCategoryForm(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Create',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoAddParentCategory(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AddParentCategoryBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoAddParentCategory(BuildContext context) {
  if (context
      .read<AddParentCategoryCubit>()
      .formKey
      .currentState!
      .validate()) {
    context.read<AddParentCategoryCubit>().addparentcategory();
  }
}
