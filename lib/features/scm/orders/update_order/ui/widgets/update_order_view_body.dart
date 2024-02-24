import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:erp_system/features/scm/orders/update_order/logic/update_order_cubit.dart';
import 'package:erp_system/features/scm/orders/update_order/ui/widgets/update_order_bloc_listner.dart';
import 'package:erp_system/features/scm/orders/update_order/ui/widgets/update_order_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOrderBody extends StatelessWidget {
  final int orderId;
  const UpdateOrderBody({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          title: 'Edit Order',
          iconLeading: const CustomBackButton(),
          iconTrailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
          ),
        ),
        Expanded(
          child: CustomAppBody(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: UpdateOrderForm(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AppTextButton(
                    buttonText: 'Edit',
                    textStyle: Styles.font16LightGreyMedium(context),
                    backgroundColor: ColorsApp.primaryColor,
                    onPressed: () {
                      validateThenDoUpdateParentCategory(context, orderId);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const UpdateOrderBlocListener(),
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
