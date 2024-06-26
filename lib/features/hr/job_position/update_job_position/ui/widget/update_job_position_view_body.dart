import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/logic/update_job_position_cubit.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/ui/widget/update_job_position_bloc.dart';
import 'package:erp_system/features/hr/job_position/update_job_position/ui/widget/update_job_position_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateJobPositionViewBody extends StatelessWidget {
  const UpdateJobPositionViewBody({
    super.key,
    required this.depId,
    required this.jobId,
    required this.jobName,
  });
  final int jobId;
  final int depId;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          title: 'Edit Job Position',
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: UpdateJobPositionForm(
                      jobName: jobName,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Edit',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoUpdateJobPosition(context, jobId, depId);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UpdateJobPositionBloc(
                    depId: depId,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateJobPosition(
    BuildContext context, int jobId, int depId) {
  if (context.read<UpdateJObPositionCubit>().formKey.currentState!.validate()) {
    context.read<UpdateJObPositionCubit>().updateJobPosition(jobId, depId);
  }
}
