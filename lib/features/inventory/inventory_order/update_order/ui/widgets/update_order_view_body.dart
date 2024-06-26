import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/inventory_order/inventory_order_details/data/models/order_details_model.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/ui/widgets/update_order_bloc_listner.dart';
import 'package:erp_system/features/inventory/inventory_order/update_order/ui/widgets/update_order_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderBody extends StatelessWidget {
  final OrderDetailsModel orderData;
  const UpdateOrderBody({
    super.key,
    required this.orderData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Update Order',
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: CustomAppBody(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: UpdateOrderForm(
                    orderData: orderData,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AppTextButton(
                    buttonText: 'Save',
                    textStyle: Styles.font16LightGreyMedium(context)
                        .copyWith(fontSize: 13),
                    backgroundColor: ColorsApp.primaryColor,
                    onPressed: () {
                      validateThenDoUpdateParentCategory(
                        context,
                        orderData.data!.id!,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UpdateOrderBlocListener(
                  orderId: orderData.data!.id!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateParentCategory(BuildContext context, int orderId) {
  if (context.read<UpdateOrderCubit>().formKey.currentState!.validate()) {
    context.read<UpdateOrderCubit>().updateOrder(orderId);
  }
}
