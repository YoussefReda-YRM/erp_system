import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDepartmentForm extends StatelessWidget {
  const UpdateDepartmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<UpdateDepartmentCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<UpdateDepartmentCubit>()
                .departmentNameController,
            hintText: "Department Name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Department name';
              }
            },
          ),
          const SizedBox(height: 10,),
          AppTextFormField(
            controller: context
                .read<UpdateDepartmentCubit>()
                .departmentDescriptionController,
            hintText: "Department description ",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Department description ';
              }
            },
          ),
        ],
      ),
    );
  }
}
