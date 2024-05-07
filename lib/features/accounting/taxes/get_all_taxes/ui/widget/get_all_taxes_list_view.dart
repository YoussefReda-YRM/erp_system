import 'package:erp_system/features/accounting/taxes/get_all_taxes/logic/get_all_taxes_cubit.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/logic/get_all_taxes_state.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/ui/widget/get_all_taxes_list_view_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllTaxesListView extends StatelessWidget {
  const GetAllTaxesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTaxesCubit, GetAllTaxesState>(
        builder: (context, state) {
          if (state is GetAllTaxesLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetAllTaxesSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                return GetAllTaxesListViewItem(
                  data: state.response[index],
                );
              },
            );
          } else if (state is GetAllTaxesFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        });
  }
}
