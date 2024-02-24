import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_card_home_view.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_cubit.dart';
import 'package:erp_system/features/inventory/inventory_home/logic/inventory_home_state.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListOfCards extends StatelessWidget {
  const ListOfCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomAppBody(
        child: BlocBuilder<InventoryHomeCubit, InventoryHomeState>(
          builder: (context, state) {
            if (state is InventoryHomeLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state is InventoryHomeSuccess) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomCardHomeView(
                          title:
                              'All Products: ${state.response.productsCount}',
                          image: AssetsData.product,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Expanded(
                        child: CustomCardHomeView(
                          title: 'Replienshment: ${state.response.replenishmentCount}',
                          image: AssetsData.replensh,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is InventoryHomeFailure) {
              return CustomErrorWidget(error: state.error.toString());
            } else {
              return const CustomNoProductWidget();
            }
          },
        ),
      ),
    );
  }
}