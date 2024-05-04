import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/orders/inventory_order/logic/get_all_inventory_orders_cubit.dart';
import 'package:erp_system/features/scm/orders/inventory_order/logic/get_all_inventory_orders_state.dart';
import 'package:erp_system/features/scm/orders/inventory_order/ui/widgets/order_scm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInventoryOrdersViewBody extends StatelessWidget {
  const GetAllInventoryOrdersViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Inventory Orders",
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
          iconTrailing: IconButton(
            icon: const Icon(
              Icons.search_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {},
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
                child: BlocBuilder<GetAllInventoryOrdersCubit,
                    GetAllInventoryOrdersState>(
                  builder: (context, state) {
                    if (state is GetAllInventoryOrdersLoading) {
                      return const CustomCircularProgressIndicator();
                    } else if (state is GetAllInventoryOrdersSuccess) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.response.data!.length,
                        itemBuilder: (context, index) {
                          return OrderScmItem(
                            data: state.response.data![index],
                          );
                        },
                      );
                    } else if (state is GetAllInventoryOrdersFailure) {
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
