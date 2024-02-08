import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/core/utils/functions/show_success_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_cubit.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_state.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BodyShowModalBottomSheet extends StatelessWidget {
  const BodyShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddProductCubit>(),
      child: BlocConsumer<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state is AddProductLoading) {
            return customLoadingIndicator(context);
          } else if (state is AddProductSuccess) {
            GoRouter.of(context).pop();
            showSuccessDialog(
              context,
              state.addProductResponse.message.toString(),
              'Your product has been successfully created.',
            );
          } else if (state is AddProductFailure) {
            setupErrorState(context, state.error.toString());
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create Product",
                    style:
                        Styles.font18LightGreyBold.copyWith(color: Colors.pink),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const AddProductForm(),
                          const SizedBox(
                            height: 30,
                          ),
                          AppTextButton(
                            buttonText: 'Create',
                            textStyle: Styles.font16LightGreyMedium,
                            backgroundColor: ColorsApp.primaryColor,
                            onPressed: () {
                              validateThenDoAddProduct(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // const AddProductBlocListner(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void validateThenDoAddProduct(BuildContext context) {
  // if (BlocProvider.of<AddProductCubit>(context)
  //     .formKey
  //     .currentState!
  //     .validate()) {
  BlocProvider.of<AddProductCubit>(context).addProduct();
  // }
}
