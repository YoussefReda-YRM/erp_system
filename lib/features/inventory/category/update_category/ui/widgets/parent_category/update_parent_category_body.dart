import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_parent_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/widgets/parent_category/update_parent_category_bloc_listner.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/widgets/parent_category/update_parent_category_form.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateParentCategoryBody extends StatelessWidget {
  final int parentId;
  const UpdateParentCategoryBody({
    super.key,
    required this.parentId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Edit parent Category',
          iconLeading: CustomBackButton(),
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
                    child: UpdateParentCategoryForm(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Edit',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoUpdateParentCategory(context, parentId);
                        // context
                        //     .read<UpdateParentCategoryCubit>()
                        //     .updateparentcategory(parentId);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const UpdateParentCategoryBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateParentCategory(BuildContext context, int parentId) {
  if (context
      .read<UpdateParentCategoryCubit>()
      .formKey
      .currentState!
      .validate()) {
    context.read<UpdateParentCategoryCubit>().updateparentcategory(parentId);
  }
}
