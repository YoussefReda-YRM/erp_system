import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/logic/update_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/ui/widget/update_vacation_bloc.dart';
import 'package:erp_system/features/hr/vacations/update_vacation/ui/widget/update_vacation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVacationBody extends StatelessWidget {
  const UpdateVacationBody({super.key,required this.getAllVacationModel});
  final GetAllVacationModel getAllVacationModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomAppBarApp(
            title: 'Edit Vacation',
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
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    const UpdateVacationBloc(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoUpdateVacation(BuildContext context, int id) {
  if (context.read<UpdateVacationCubit>().formKey.currentState!.validate()) {
    context.read<UpdateVacationCubit>().updateVacation(id);
  }
}
