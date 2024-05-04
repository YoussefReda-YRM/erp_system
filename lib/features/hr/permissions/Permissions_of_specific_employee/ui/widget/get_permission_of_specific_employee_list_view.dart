import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/logic/get_permission_of_specific_employee_cubit.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/logic/get_permission_of_specific_employee_state.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/ui/widget/get_permission_of_specific_employee_list_view_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPermissionOfSpecificEmployeeListView extends StatelessWidget {
  const GetPermissionOfSpecificEmployeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPermissionOfSpecificEmployeeCubit, GetPermissionsOfSpecificEmployeeState>(
        builder: (context, state) {
          if (state is GetPermissionsOfSpecificEmployeeLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetPermissionsOfSpecificEmployeeSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                return GetAllPermissionOfSpecificEmployeeListViewItem(
                  data: state.response[index],
                );
              },
            );
          } else if (state is GetPermissionsOfSpecificEmployeeFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        });
  }
}
