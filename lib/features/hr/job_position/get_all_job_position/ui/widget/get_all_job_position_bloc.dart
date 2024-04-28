import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/logic/get_all_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/logic/get_all_job_position_state.dart';
import 'package:erp_system/features/hr/job_position/get_all_job_position/ui/widget/job_position_list_view_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllJobPositionBloc extends StatelessWidget{
  const GetAllJobPositionBloc({super.key,required this.depId});
  final int depId;

  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: BlocBuilder<GetAllJobPositionCubit, GetAllJobPositionState>(
        builder: (context, state) {
          if (state is GetAllJobPositionLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetAllJobPositionSuccess) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                child: JobPositionListViewBody(
                  depId: depId,
                  response: state.response,
                  //  context,
                ),
              ),
            );
          } else if (state is GetAllJobPositionFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        },
      ),
    );
  }
}
