import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_state.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/product_list_view_body.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
        ),
        child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
          builder: (context, state) {
            if (state is GetAllProductLoading) {
              return const CustomCircularProgressIndicator();
            } else if (state is GetAllProductSuccess) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: buildDataTable(
                        state.response,
                        context,
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is GetAllProductFailure) {
              return CustomErrorWidget(error: state.error);
            } else {
              return const CustomNoProductWidget();
            }
          },
        ),
      ),
    );
  }
}





/*
Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Name", style: Styles.font15DarkBlueMedium),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("Category", style: Styles.font15DarkBlueMedium),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("On Hand", style: Styles.font15DarkBlueMedium),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: ColorsApp.primaryColor,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.response.data?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      state.response.data![index].productName
                                          .toString(),
                                      style: Styles.font15DarkBlueMedium,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      state.response.data![index].category
                                          .toString(),
                                      style: Styles.font15DarkBlueMedium,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      state.response.data![index].productOnHand
                                          .toString(),
                                      style: Styles.font15DarkBlueMedium,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 0.2,
                                  color: ColorsApp.primaryColor,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
 */