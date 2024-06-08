import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/department/get_all_department/data/models/get_all_department_response.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_cubit.dart';
import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_bloc_listener.dart';
import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDepartmentBody extends StatelessWidget {
  final GetAllDepartmentResponse departmentData;
  const UpdateDepartmentBody({super.key, required this.departmentData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Edit Department',
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: Container(
            color: ColorsApp.primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.transparent),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: UpdateDepartmentForm(
                      departmentData: departmentData,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Edit',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoUpdateDepartment(
                          context,
                          departmentData.id,
                        );
                      },
                    ),
                  ),
                  const UpdateDepartmentBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateDepartment(BuildContext context, int id) {
  if (context.read<UpdateDepartmentCubit>().formKey.currentState!.validate()) {
    context.read<UpdateDepartmentCubit>().updateDepartment(id);
  }
}
