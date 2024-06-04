import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/category/update_category/logic/update_sub_category_cubit.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/widgets/sub_category/update_sub_category_bloc_listner.dart';
import 'package:erp_system/features/inventory/category/update_category/ui/widgets/sub_category/update_sub_category_form.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSubCategoryBody extends StatelessWidget {
  const UpdateSubCategoryBody({
    super.key,
    required this.subid,
    required this.parentid,
  });

  final int subid;
  final int parentid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Edit Sub Category',
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
                    child: UpdateSubCategoryForm(),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Edit',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoUpdateSubCategory(
                            context, subid, parentid);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const UpdateSubCategoryBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateSubCategory(
    BuildContext context, int subId, int parentId) {
  if (context.read<UpdateSubCategoryCubit>().formKey.currentState!.validate()) {
    context.read<UpdateSubCategoryCubit>().updatesubcategory(subId, parentId);
  }
}
