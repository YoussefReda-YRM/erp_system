import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/job_position/add_job_position/logic/add_job_position_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddJobPositionForm extends StatelessWidget {
  const AddJobPositionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddJobPositionCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<AddJobPositionCubit>()
                .jobNameController,
            hintText: "Enter Job Position Name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a job position name';
              }
            },
          ),
        ],
      ),
    );
  }
}
