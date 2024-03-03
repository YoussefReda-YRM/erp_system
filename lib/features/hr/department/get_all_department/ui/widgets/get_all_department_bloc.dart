import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/department/get_all_department/logic/get_all_deparment_state.dart';
import 'package:erp_system/features/hr/department/get_all_department/logic/get_all_department_cubit.dart';
import 'package:erp_system/features/hr/department/get_all_department/ui/widgets/department_list_view_body.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllDepartmentBloc extends StatelessWidget {

   GetAllDepartmentBloc({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      child: BlocBuilder<GetAllDepartmentCubit, GetAllDepartmentState>(
        builder: (context, state) {
          if (state is GetAllDepartmentLoading) {
            return const CustomCircularProgressIndicator();
          } else if (state is GetAllDepartmentSuccess) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                child: DepartmentListViewBody(

                  state.response,
                  //  context,
                ),
              ),
            );
          } else if (state is GetAllDepartmentFailure) {
            return CustomErrorWidget(error: state.error);
          } else {
            return const CustomNoProductWidget();
          }
        },
      ),
    );
  }
}
