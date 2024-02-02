import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/show_product_category_dialog.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            AppTextFormField(
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
              hintText: 'sale price',
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
