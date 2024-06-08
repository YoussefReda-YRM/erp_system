import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_cubit.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_state.dart';
import 'package:erp_system/features/inventory/replenishment/logic/re_order_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/re_order_bloc_listnere.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/show_accounting_employee_dialog.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/show_supplier_dialog.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erp_system/features/inventory/replenishment/data/models/stock_out_products_response.dart';

class ReOrderForm extends StatelessWidget {
  const ReOrderForm({
    super.key,
    required this.data,
  });

  final StockOutProductsResponse data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Re-order the ${data.productName}",
          style: Styles.font18DarkBlueBold(context).copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: ColorsApp.primaryColor),
            ),
            color: Colors.white,
            child: Center(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Form(
                      key: context.read<ReOrderCubit>().formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            keyboardType: TextInputType.number,
                            hintText: 'Enter The Quantity',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorsApp.primaryColor,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a quantity product';
                              }
                            },
                            controller:
                                context.read<ReOrderCubit>().quantityController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextFormField(
                            hintText: 'Enter The Refernce',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorsApp.primaryColor,
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a Refernce';
                              }
                            },
                            controller: context
                                .read<ReOrderCubit>()
                                .referenceController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<GetAllAccountingEmployeeCubit,
                              GetAllAccountingEmployeeState>(
                            builder: (context, state) {
                              if (state is GetAllAccountingEmployeeLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state
                                  is GetAllAccountingEmployeeFailure) {
                                return Center(child: Text(state.error));
                              } else if (state
                                  is GetAllAccountingEmployeeSuccess) {
                                final getAllAccounting = state.getAllAccounting;

                                return AppTextFormField(
                                  controller: context
                                      .read<ReOrderCubit>()
                                      .accEmployeeNameController,
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
                                        BlocProvider.of<ReOrderCubit>(context));
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select Accounting Employee';
                                    }
                                  },
                                );
                              } else {
                                return const Text(
                                    "Wait for the Accounting Employee to load...");
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<GetAllSupplierCubit, GetAllSupplierState>(
                            builder: (context, state) {
                              if (state is GetAllSupplierLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is GetAllSupplierFailure) {
                                return Center(child: Text(state.error));
                              } else if (state is GetAllSupplierSuccess) {
                                final getAllSupplier = state.response;

                                return AppTextFormField(
                                  controller: context
                                      .read<ReOrderCubit>()
                                      .supplierNameController,
                                  hintText: 'Select Supplier',
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
                                    showSupplierDialog(
                                        context,
                                        size,
                                        getAllSupplier,
                                        BlocProvider.of<ReOrderCubit>(context));
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select Supplier';
                                    }
                                  },
                                );
                              } else {
                                return const Text(
                                    "Wait for the Supplier to load...");
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextButton(
                            buttonText: "Re-order",
                            backgroundColor: ColorsApp.primaryColor,
                            textStyle:
                                Styles.font16LightGreyMedium(context).copyWith(
                              color: Colors.white,
                            ),
                            onPressed: () {
                              validateThenDoReOrder(
                                context,
                                data.id!,
                              );
                            },
                          ),
                          const ReOrderBlocListener(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoReOrder(BuildContext context, int productId) {
  if (BlocProvider.of<ReOrderCubit>(context).formKey.currentState!.validate()) {
    BlocProvider.of<ReOrderCubit>(context).reOrder(productId);
  }
}
