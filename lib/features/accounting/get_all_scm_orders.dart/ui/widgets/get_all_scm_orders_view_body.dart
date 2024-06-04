import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/logic/get_all_scm_orders_cubit.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/logic/get_all_scm_orders_state.dart';
import 'package:erp_system/features/accounting/get_all_scm_orders.dart/ui/widgets/scm_order_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllScmOrdersViewBody extends StatelessWidget {
  const GetAllScmOrdersViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Scm Orders",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        Expanded(
            child: CustomAppBody(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<GetAllScmOrdersCubit, GetAllScmOrdersState>(
                  builder: (context, state) {
                    if (state is GetAllScmOrdersLoading) {
                      return const CustomCircularProgressIndicator();
                    } else if (state is GetAllScmOrdersSuccess) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.response.length,
                        itemBuilder: (context, index) {
                          return ScmOrderItem(
                            order: state.response[index],
                          );
                        },
                      );
                    } else if (state is GetAllScmOrdersFailure) {
                      return CustomErrorWidget(error: state.error);
                    } else {
                      return const CustomNoProductWidget();
                    }
                  },
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
