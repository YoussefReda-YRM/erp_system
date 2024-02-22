import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddParentCategoryForm extends StatelessWidget {
  const AddParentCategoryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddParentCategoryCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<AddParentCategoryCubit>()
                .parentCategoryNameController,
            hintText: "Enter Category Name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a parent category name';
              }
            },
          ),
        ],
      ),
    );
  }
}
