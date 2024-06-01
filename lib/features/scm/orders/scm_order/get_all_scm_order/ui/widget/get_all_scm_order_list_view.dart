import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/logic/get_all_scm_order_cubit.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/logic/get_all_scm_order_state.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/ui/widget/get_all_scm_order_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllScmOrderListView extends StatelessWidget {
  const GetAllScmOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllScmOrderCubit, GetAllScmOrderState>(
        builder: (context, state) {
      if (state is GetAllScmOrderLoading) {
        return const CustomCircularProgressIndicator();
      } else if (state is GetAllScmOrderSuccess) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.response.length,
          itemBuilder: (context, index) {
            return GetAllScmOrderListViewItem(
              index: index ,
              data: state.response[index],
            );
          },
        );
      } else if (state is GetAllScmOrderFailure) {
        return CustomErrorWidget(error: state.error);
      } else {
        return const CustomNoProductWidget();
      }
    });
  }
}
