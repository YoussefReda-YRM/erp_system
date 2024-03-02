import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/logic/get_supplier_state.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_list_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierListView extends StatelessWidget {
  const SupplierListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: BlocBuilder<GetAllSupplierCubit, GetAllSupplierState>(
        builder: (context, state) {
          if (state is GetAllSupplierLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetAllSupplierSuccess) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                child: SupplierListViewBody(
                  state.response,
                  //  context,
                ),
              ),
            );
          } else if (state is GetAllSupplierFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        },
      ),
    );
  }
}
