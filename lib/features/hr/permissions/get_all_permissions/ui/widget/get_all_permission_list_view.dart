import 'package:erp_system/features/hr/permissions/get_all_permissions/logic/get_all_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/logic/get_all_permission_state.dart';
import 'package:erp_system/features/hr/permissions/get_all_permissions/ui/widget/get_all_permissions_list_view_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPermissionListView extends StatelessWidget {
  const GetAllPermissionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPermissionCubit, GetAllPermissionsState>(
        builder: (context, state) {
          if (state is GetAllPermissionsLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetAllPermissionsSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.response.length,
              itemBuilder: (context, index) {
                return GetAllPermissionsListViewItem(
                  data: state.response[index],
                );
              },
            );
          } else if (state is GetAllPermissionsFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        });
  }
}
