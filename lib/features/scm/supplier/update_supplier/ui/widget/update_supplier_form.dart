import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSupplierForm extends StatelessWidget {
  const UpdateSupplierForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpdateSupplierCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<UpdateSupplierCubit>()
                .supplierNameController,
            hintText: "Supplier Name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a supplier name';
              }
            },
          ),
          SizedBox(height: 10,),
          AppTextFormField(
            controller: context
                .read<UpdateSupplierCubit>()
                .supplierEmailController,
            hintText: "supplier email",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a supplier email';
              }
            },
          ),
          SizedBox(height: 10,),
          AppTextFormField(
            controller: context
                .read<UpdateSupplierCubit>()
                .supplierPhoneController,
            hintText: "supplier phone",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a supplier phone';
              }
            },
          ),
        ],
      ),
    );
  }
}
