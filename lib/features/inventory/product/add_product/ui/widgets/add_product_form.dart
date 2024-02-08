import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/show_product_category_dialog.dart';
import 'package:flutter/material.dart';

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
      key: getIt.get<AddProductCubit>().formKey, //context.read<AddProductCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            AppTextFormField(
              controller: getIt.get<AddProductCubit>().productNameController,
              hintText: 'product name',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsApp.primaryColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextFormField(
              controller: getIt.get<AddProductCubit>().productOnHandController,
              hintText: 'product on hand',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsApp.primaryColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid product on hand';
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextFormField(
              controller: getIt.get<AddProductCubit>().productCostPriceController,
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
            const SizedBox(
              height: 10,
            ),
            AppTextFormField(
              controller: getIt.get<AddProductCubit>().productSellPriceController,
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
                  return 'Please enter a valid sale price';
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextFormField(
              controller: getIt.get<AddProductCubit>().subCategoryIdController,
              hintText: 'product category',
              isEnabled: false,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsApp.primaryColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
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
      ),
    );
  }
}
