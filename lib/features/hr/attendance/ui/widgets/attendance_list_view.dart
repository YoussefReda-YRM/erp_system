import 'package:erp_system/features/hr/attendance/logic/get_all_attendance_cubit.dart';
import 'package:erp_system/features/hr/attendance/logic/get_all_attendance_state.dart.dart';
import 'package:erp_system/features/hr/attendance/ui/widgets/attendance_list_view_item.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceListView extends StatelessWidget {
  const AttendanceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAttendanceCubit, GetAllAttendanceState>(
      builder: (context, state) {
        if (state is GetAllAttendanceLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is GetAllAttendanceSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.response.data?.length,
            itemBuilder: (context, index) {
              return AttendanceListViewItem(
                data : state.response.data![index],
              );
            },
          );
        } else if (state is GetAllAttendanceFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
