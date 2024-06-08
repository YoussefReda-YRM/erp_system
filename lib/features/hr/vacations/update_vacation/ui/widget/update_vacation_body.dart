import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/ui/widget/update_vacation_bloc.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/ui/widget/update_vacation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVacationBody extends StatelessWidget {
  const UpdateVacationBody(
      {super.key, required this.getAllVacationModel, required this.title});
  final GetAllVacationModel getAllVacationModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Edit Vacation',
          iconLeading: CustomBackButton(),
        ),
        CustomAppBody(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: UpdateVacationForm(
                  getAllVacationModel: getAllVacationModel,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AppTextButton(
                  buttonText: 'Edit',
                  textStyle: Styles.font16LightGreyMedium(context),
                  backgroundColor: ColorsApp.primaryColor,
                  onPressed: () {
                    validateThenDoUpdateVacation(
                      context,
                      getAllVacationModel.id as int,
                    );
                  },
                ),
              ),
              UpdateVacationBloc(
                title: title,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateVacation(BuildContext context, int id) {
  if (context.read<UpdateVacationCubit>().formKey.currentState!.validate()) {
    context.read<UpdateVacationCubit>().updateVacation(id);
  }
}
