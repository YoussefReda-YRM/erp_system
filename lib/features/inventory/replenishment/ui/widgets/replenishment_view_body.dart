import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/inventory/replenishment/logic/stock_out_products_cubit.dart';
import 'package:erp_system/features/inventory/replenishment/logic/stock_out_products_state.dart';
import 'package:erp_system/features/inventory/replenishment/ui/widgets/replenishment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplenishmentViewBody extends StatelessWidget {
  const ReplenishmentViewBody({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockOutProductsCubit, StockOutProductstState>(
      builder: (context, state) {
        if (state is StockOutProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StockOutProductsFailure) {
          return Center(child: Text(state.error));
        } else if (state is StockOutProductsSuccess) {
          return Column(
            children: [
              CustomAppBarApp(
                scaffoldKey: scaffoldKey,
                title: "Replenishments",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${state.response.length.toString()} items",
                        style: Styles.font18DarkBlueBold(context)
                            .copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.response.length,
                          itemBuilder: (context, index) {
                            return ReplenishmentItem(
                              data: state.response[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text("There is no Replenishment");
        }
      },
    );
  }
}
