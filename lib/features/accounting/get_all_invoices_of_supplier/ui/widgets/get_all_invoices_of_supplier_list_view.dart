import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/logic/get_all_invoices_of_supplier_cubit.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/logic/get_all_invoices_of_supplier_state.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/ui/widgets/get_all_invoices_of_supplier_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllInvoicesOfSupplierListView extends StatelessWidget {
  const GetAllInvoicesOfSupplierListView({super.key, required this.supplierId});
  final int supplierId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllInvoicesOfSupplierCubit,
        GetAllInvoicesOfSupplierState>(
      builder: (context, state) {
        if (state is GetAllInvoicesOfSupplierLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is GetAllInvoicesOfSupplierSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                return GetAllInvoicesOfSupplierItem(
                  invoice: state.response[index],
                  supplierId: supplierId,
                );
              },
            ),
          );
        } else if (state is GetAllInvoicesOfSupplierFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
