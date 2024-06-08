import 'package:erp_system/features/accounting/get_all_invoices/logic/get_all_invoices_cubit.dart';
import 'package:erp_system/features/accounting/get_all_invoices/logic/get_all_invoices_state.dart';
import 'package:erp_system/features/accounting/get_all_invoices/ui/widgets/get_all_invoices_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInvoicesListView extends StatelessWidget {
  const GetAllInvoicesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllInvoicesCubit, GetAllInvoicesState>(
      builder: (context, state) {
        if (state is GetAllInvoicesLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is GetAllInvoicesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                return GetAllInvoicesItem(
                  invoice: state.response[index],
                  supplierId: state.response[index].id!,
                );
              },
            ),
          );
        } else if (state is GetAllInvoicesFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
