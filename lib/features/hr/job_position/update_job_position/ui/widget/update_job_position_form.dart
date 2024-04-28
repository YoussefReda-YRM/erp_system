import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateJobPositionForm extends StatelessWidget {
  const UpdateJobPositionForm({super.key, required this.jobName});

  final String jobName;

  @override
  Widget build(BuildContext context) {
    context.read<UpdateJObPositionCubit>().jobPositionNameController.text =
        jobName.toString();
    return Form(
      key: context.read<UpdateJObPositionCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context
                .read<UpdateJObPositionCubit>()
                .jobPositionNameController,
            hintText: "Job Position Name",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.primaryColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Job Position name';
              }
            },
          ),
        ],
      ),
    );
  }
}
