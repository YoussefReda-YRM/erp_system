import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/show_product_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: context.read<AddProductCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "product name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid product name';
              }
            },
            controller: context.read<AddProductCubit>().productNameController,
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: 'on hand',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid on hand';
              }
            },
            controller: context.read<AddProductCubit>().productOnHandController,
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            controller:
                context.read<AddProductCubit>().productCostPriceController,
            hintText: 'cost price',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid cost price';
              }
            },
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            controller:
                context.read<AddProductCubit>().productSellPriceController,
            hintText: 'sell price',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid sell price';
              }
            },
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: 'income',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid income';
              }
            },
            controller:
                context.read<AddProductCubit>().productInComingController,
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            hintText: 'out going',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid out going';
              }
            },
            controller:
                context.read<AddProductCubit>().productOutGoingController,
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            controller: context.read<AddProductCubit>().subCategoryIdController,
            hintText: 'Select category',
            isEnabled: false,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            suffixIcon: const Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: ColorsApp.primaryColor,
            ),
            function: () {
              showProductCategoriesDialog(
                context,
                size,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a product category';
              }
            },
          ),
        ],
      ),
    );
  }
}
