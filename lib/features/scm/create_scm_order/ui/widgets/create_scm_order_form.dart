import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_cubit.dart';
import 'package:erp_system/features/inventory/get_all_accounting_employee/logic/get_all_sup_category_state.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_state.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/show_accounting_employee_dialog.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/show_supplier_dialog.dart';
import 'package:erp_system/features/scm/create_scm_order/data/models/create_scm_order_request.dart';
import 'package:erp_system/features/scm/create_scm_order/logic/create_scm_order_cubit.dart';
import 'package:erp_system/features/scm/create_scm_order/ui/widgets/create_scm_order_bloc_listnere.dart';
import 'package:erp_system/features/scm/create_scm_order/ui/widgets/show_products_dialog.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateScmOrderViewBodyForm extends StatefulWidget {
  CreateScmOrderViewBodyForm({
    super.key,
  });

  final List<Product> products = [];

  @override
  State<CreateScmOrderViewBodyForm> createState() =>
      _CreateScmOrderViewBodyFormState();
}

class _CreateScmOrderViewBodyFormState
    extends State<CreateScmOrderViewBodyForm> {
  void _addProduct() {
    if (BlocProvider.of<CreateScmOrderCubit>(context)
            .productIdController
            .text
            .isNotEmpty &&
        BlocProvider.of<CreateScmOrderCubit>(context)
            .quantityController
            .text
            .isNotEmpty) {
      setState(() {
        widget.products.add(
          Product(
            productId: int.parse(
              BlocProvider.of<CreateScmOrderCubit>(context)
                  .productIdController
                  .text,
            ),
            quantity: int.parse(
              BlocProvider.of<CreateScmOrderCubit>(context)
                  .quantityController
                  .text,
            ),
          ),
        );
        BlocProvider.of<CreateScmOrderCubit>(context)
            .productIdController
            .clear();
        BlocProvider.of<CreateScmOrderCubit>(context)
            .quantityController
            .clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
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
                      key: context.read<CreateScmOrderCubit>().formKey,
                      child: Column(
                        children: [
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
                                .read<CreateScmOrderCubit>()
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
                                      .read<CreateScmOrderCubit>()
                                      .accountingNameController,
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
                                      BlocProvider.of<CreateScmOrderCubit>(
                                          context),
                                    );
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
                                      .read<CreateScmOrderCubit>()
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
                                        BlocProvider.of<CreateScmOrderCubit>(
                                            context));
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
                          BlocBuilder<GetAllProductCubit, GetAllProductState>(
                            builder: (context, state) {
                              if (state is GetAllProductLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is GetAllProductFailure) {
                                return Center(child: Text(state.error));
                              } else if (state is GetAllProductSuccess) {
                                final getAllProduct = state.response;

                                return AppTextFormField(
                                  controller: context
                                      .read<CreateScmOrderCubit>()
                                      .productNameController,
                                  hintText: 'Select Product',
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
                                    showProductsDialog(
                                        context, size, getAllProduct);
                                  },
                                  validator: (value) {},
                                );
                              } else {
                                return const Text(
                                    "Wait for the products to load...");
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                            validator: (value) {},
                            controller: context
                                .read<CreateScmOrderCubit>()
                                .quantityController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: _addProduct,
                            child: Text(
                              'Add Product',
                              style: Styles.font14DarkBlueMedium(context),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.products.length,
                            itemBuilder: (context, index) {
                              final product = widget.products[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    'Product Name: ${context
                                      .read<CreateScmOrderCubit>()
                                      .productNameController.text} - Quantity: ${product.quantity}',
                                    style: Styles.font13BlueSemiBold(context),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.products.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          AppTextButton(
                            buttonText: "Create",
                            backgroundColor: ColorsApp.primaryColor,
                            textStyle:
                                Styles.font16LightGreyMedium(context).copyWith(
                              color: Colors.white,
                            ),
                            onPressed: () {
                              validateThenDoCreateScmOrder(
                                  context, widget.products);
                            },
                          ),
                          const CreateScmOrderBlocListener(),
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

void validateThenDoCreateScmOrder(
    BuildContext context, List<Product> products) {
  if (BlocProvider.of<CreateScmOrderCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<CreateScmOrderCubit>(context).createScmOrder(products);
  }
}
