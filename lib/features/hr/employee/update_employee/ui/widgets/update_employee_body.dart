import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/data/models/employee_response.dart';
import 'package:erp_system/features/hr/employee/update_employee/logic/update_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/update_employee/ui/widgets/update_employee_bloc_listner.dart';
import 'package:erp_system/features/hr/employee/update_employee/ui/widgets/update_employee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateEmployeeBody extends StatelessWidget {
  final EmployeeData employeeData;
  const UpdateEmployeeBody({
    super.key,
    required this.employeeData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          title: 'Edit Employee',
          iconLeading: const CustomBackButton(),
          iconTrailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
          ),
        ),
        Expanded(
          child: CustomAppBody(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    UpdateEmployeeForm(
                      employeeData: employeeData,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextButton(
                      buttonText: 'Save',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoUpdateEmployee(
                            context, employeeData.userId.toString());
                      },
                    ),
                    const UpdateEmployeeBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateEmployee(BuildContext context, String employeeId) {
  context.read<UpdateEmployeeCubit>().updateEmployee(employeeId);
  // if (context.read<UpdateEmployeeCubit>().formKey.currentState!.validate()) {

  // }
}
