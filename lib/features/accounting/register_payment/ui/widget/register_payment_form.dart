import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/accounting/register_payment/logic/register_payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPaymentForm extends StatelessWidget {
  const RegisterPaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterPaymentCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            keyboardType: TextInputType.number,
            controller: context.read<RegisterPaymentCubit>().amountController,
            hintText: "Enter Amount",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an amount';
              }
            },
          ),
        ],
      ),
    );
  }
}
