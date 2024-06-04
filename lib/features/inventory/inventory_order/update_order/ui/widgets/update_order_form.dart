import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_cubit.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_state.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/models/order_details_model.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/show_accounting_employee_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderForm extends StatefulWidget {
  const UpdateOrderForm({
    super.key,
    required this.orderData,
  });

  final OrderDetailsModel orderData;

  @override
  State<UpdateOrderForm> createState() => _UpdateOrderFormState();
}

class _UpdateOrderFormState extends State<UpdateOrderForm> {
  @override
  void initState() {
    super.initState();

    context.read<UpdateOrderCubit>().quantityController.text =
        widget.orderData.data!.quantity.toString();

    context.read<UpdateOrderCubit>().referenceController.text =
        widget.orderData.data!.reference!;

    context.read<UpdateOrderCubit>().accEmployeeIdController.text =
        widget.orderData.data!.accEmployee!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: context.read<UpdateOrderCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<UpdateOrderCubit>().quantityController,
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
            controller: context.read<UpdateOrderCubit>().referenceController,
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
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<GetAllAccountingEmployeeCubit,
              GetAllAccountingEmployeeState>(
            builder: (context, state) {
              if (state is GetAllAccountingEmployeeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllAccountingEmployeeFailure) {
                return Center(child: Text(state.error));
              } else if (state is GetAllAccountingEmployeeSuccess) {
                final getAllAccounting = state.getAllAccounting;

                return AppTextFormField(
                  controller:
                      context.read<UpdateOrderCubit>().accEmployeeIdController,
                  hintText: 'Select Accounting Employee',
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
                    showAccountingEmployeeDialog(
                        context,
                        size,
                        getAllAccounting,
                        BlocProvider.of<UpdateOrderCubit>(context));
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select Accounting Employee';
                    }
                  },
                );
              } else {
                return const Text(
                  "Wait for the Accounting Employee to load...",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
