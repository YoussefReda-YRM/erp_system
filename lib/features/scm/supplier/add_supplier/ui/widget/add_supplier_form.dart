import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/scm/supplier/add_supplier/logic/add_supplier_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSupplierForm extends StatelessWidget{
  const AddSupplierForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<AddSupplierCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<AddSupplierCubit>()
                .supplierNameController,
            hintText: "Enter supplier name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter supplier name';
              }
            },
          ),
        const  SizedBox(height: 15,),
          AppTextFormField(
            controller: context
                .read<AddSupplierCubit>()
                .supplierEmailController,
            hintText: "Enter supplier Email",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter supplier email';
              }
            },
          ),
         const SizedBox(height: 15,),
          AppTextFormField(
            controller: context
                .read<AddSupplierCubit>()
                .supplierPhoneController,
            hintText: "Enter Supplier phone",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter supplier phone';
              }
            },
          ),
        ],
      ),
    );
  }
}
