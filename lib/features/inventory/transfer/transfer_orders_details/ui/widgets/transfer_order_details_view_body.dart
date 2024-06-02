import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/inventory/orders/order_details/logic/order_details_cubit.dart';
import 'package:erp_system/features/inventory/orders/order_details/logic/order_details_state.dart';
import 'package:erp_system/features/inventory/transfer/transfer_orders_details/ui/widgets/transfer_order_details_view_body_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferOrderDetailsViewBody extends StatelessWidget {
  const TransferOrderDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is OrderDetailsLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is OrderDetailsSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: ColorsApp.primaryColor),
                    ),
                    color: Colors.white,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: TransferOrderDetailsViewBodyItems(
                          orderDetailsModel: state.response,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is OrderDetailsFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
