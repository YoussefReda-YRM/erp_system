import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/logic/get_all_sup_category_cubit.dart';
import 'package:erp_system/features/inventory/category/get_all_sup_category/logic/get_all_sup_category_state.dart';
import 'package:erp_system/features/inventory/product/details_product/data/models/details_product_model.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_cubit.dart';
import 'package:erp_system/features/inventory/product/update_product/ui/widgets/show_product_category_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductForm extends StatefulWidget {
  const UpdateProductForm({super.key, required this.productData});

  final DetailsProductModel productData;

  @override
  State<UpdateProductForm> createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllSupCategoryCubit>().getAllSupCategories();

    context.read<UpdateProductCubit>().productNameController.text =
        widget.productData.productName!;
    context.read<UpdateProductCubit>().productOnHandController.text =
        widget.productData.productOnHand.toString();
    context.read<UpdateProductCubit>().productCostPriceController.text =
        widget.productData.productCostPrice.toString();
    context.read<UpdateProductCubit>().productSellPriceController.text =
        widget.productData.productSellPrice.toString();
    context.read<UpdateProductCubit>().productInComingController.text =
        widget.productData.productInComing.toString();
    context.read<UpdateProductCubit>().productOutGoingController.text =
        widget.productData.productOutGoing.toString();
    context.read<UpdateProductCubit>().subCategoryIdController.text =
        widget.productData.category!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: context.read<UpdateProductCubit>().formKey,
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
            controller:
                context.read<UpdateProductCubit>().productNameController,
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
            controller:
                context.read<UpdateProductCubit>().productOnHandController,
          ),
          SizedBox(height: 18.h),
          AppTextFormField(
            controller:
                context.read<UpdateProductCubit>().productCostPriceController,
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
                context.read<UpdateProductCubit>().productSellPriceController,
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
                context.read<UpdateProductCubit>().productInComingController,
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
                context.read<UpdateProductCubit>().productOutGoingController,
          ),
          SizedBox(height: 18.h),
          BlocBuilder<GetAllSupCategoryCubit, GetAllSupCategoryState>(
            builder: (context, state) {
              if (state is GetAllSupCategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllSupCategoryFailure) {
                return Center(child: Text(state.error));
              } else if (state is GetAllSupCategorySuccess) {
                final categories = state.categories;
                return AppTextFormField(
                  controller: context
                      .read<UpdateProductCubit>()
                      .subCategoryIdController,
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
                      categories,
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a product category';
                    }
                  },
                );
              } else {
                return const Text("Wait for the categories to load...");
              }
            },
          ),
        ],
      ),
    );
  }
}
