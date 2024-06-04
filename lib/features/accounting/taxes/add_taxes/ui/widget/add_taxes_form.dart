import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/logic/add_taxes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaxesForm extends StatelessWidget {
  const AddTaxesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<AddTaxesCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<AddTaxesCubit>().taxNameController,
            hintText: "Enter tax name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter tax name';
              }
            },
          ),
          const  SizedBox(height: 15,),
          AppTextFormField(
            controller: context
                .read<AddTaxesCubit>().taxTypeController,
            hintText: "Enter tax type",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter  tax type';
              }
            },
          ),
          const  SizedBox(height: 15,),
          AppTextFormField(
            controller: context
                .read<AddTaxesCubit>().taxValueController,
            hintText: "Enter tax value",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter  tax value';
              }
            },
          ),




        ],
      ),
    );
  }
}
