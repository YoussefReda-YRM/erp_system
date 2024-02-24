import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/orders/order_details/logic/order_details_cubit.dart';
import 'package:erp_system/features/scm/orders/order_details/logic/order_details_state.dart';
import 'package:erp_system/features/scm/orders/order_details/ui/widgets/order_details_view_body_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({
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
            padding: const EdgeInsets.only(top: 10),
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
                      child: OrderDetailsViewBodyItems(
                        orderDetailsModel: state.response,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextButton(
                  buttonText: "Edit",
                  width: MediaQuery.of(context).size.width / 2.5,
                  backgroundColor: Colors.green,
                  textStyle: Styles.font13BlueSemiBold(context),
                  onPressed: () {
                    accEmployeeIdControllerInGetIt =
                        state.response.data!.accEmployee.toString();
                    quantityControllerInGetIt =
                        state.response.data!.quantity.toString();
                    referenceControllerInGetIt =
                        state.response.data!.reference.toString();

                    GoRouter.of(context).push(
                      AppRouter.kUpdateOrderView,
                      extra: state.response.data!.id,
                    );
                  },
                ),
              ],
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