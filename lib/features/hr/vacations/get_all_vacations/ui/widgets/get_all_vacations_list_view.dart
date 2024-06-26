import 'package:erp_system/features/hr/vacations/get_all_vacations/logic/get_all_vacations_cubit.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/logic/get_all_vacations_state.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/ui/widgets/get_all_vacations_list_view_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllVacationsListView extends StatelessWidget {
  const GetAllVacationsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllVacationsCubit, GetAllVacationsState>(
        builder: (context, state) {
      if (state is GetAllVacationsLoading) {
        return const CustomCircularProgressIndicator();
      } else if (state is GetAllVacationsSuccess) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.response.length,
          itemBuilder: (context, index) {
            return GetAllVacationsListViewItem(
              data: state.response[index],
            );
          },
        );
      } else if (state is GetAllVacationsFailure) {
        return CustomErrorWidget(error: state.error);
      } else {
        return const CustomNoProductWidget();
      }
    });
  }
}
