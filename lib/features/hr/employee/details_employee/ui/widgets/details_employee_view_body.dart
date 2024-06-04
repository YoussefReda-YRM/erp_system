import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/hr/employee/details_employee/logic/details_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/details_employee/logic/details_employee_state.dart';
import 'package:erp_system/features/hr/employee/details_employee/ui/widgets/details_employee_view_body_items.dart';
import 'package:erp_system/features/inventory/product/get_all_product/ui/widgets/custom_no_product_widget.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsEmployeeViewBody extends StatelessWidget {
  const DetailsEmployeeViewBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsEmployeeCubit, DetailsEmployeeState>(
      builder: (context, state) {
        if (state is DetailsEmployeeLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is DetailsEmployeeSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: ColorsApp.primaryColor),
                    ),
                    color: Colors.white,
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          child: DetailsEmployeeViewBodyItems(
                            detailsEmployeeModel: state.response,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // EditAndDeleteButton(
                  //   size: size,
                  //   employeeData: state.response,
                  // ),
                ],
              ),
            ),
          );
        } else if (state is DetailsEmployeeFailure) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const CustomNoProductWidget();
        }
      },
    );
  }
}
