import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/department/add_department/logic/add_department_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDepartmentForm extends StatelessWidget{
  const AddDepartmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<AddDepartmentCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<AddDepartmentCubit>()
                .departmentNameController,
            hintText: "Enter department name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter department name';
              }
            },
          ),
        const  SizedBox(height: 15,),
          AppTextFormField(
            controller: context
                .read<AddDepartmentCubit>()
                .departmentDescriptionController,
            hintText: "Enter department description",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter  department description';
              }
            },
          ),


        ],
      ),
    );
  }
}
