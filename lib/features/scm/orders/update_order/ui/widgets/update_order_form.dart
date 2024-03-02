import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/scm/orders/update_order/logic/update_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderForm extends StatelessWidget {
  const UpdateOrderForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpdateOrderCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<UpdateOrderCubit>()
                .accEmployeeIdController,
            hintText: "Accounting Employee",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an Accounting Employee';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context
                .read<UpdateOrderCubit>()
                .quantityController,
            hintText: "Quantity Order",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Quantity Order';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context
                .read<UpdateOrderCubit>()
                .referenceController,
            hintText: "Reference",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Reference';
              }
            },
          ),
        ],
      ),
    );
  }
}
