import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/logic/apply_vacation_cubit.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/ui/widget/apply_vacation_form.dart';
import 'package:erp_system/features/hr/vacations/add_vacations/ui/widget/apply_vaction_bloc_listnere.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ApplyVacationView extends StatelessWidget {
  const ApplyVacationView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarApp(
            title: 'Apply Vacation',
            iconLeading: CustomBackButton(
              onTap: () {
                GoRouter.of(context).pop();
              },
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
                      const ApplyVacationForm(),
                      const SizedBox(
                        height: 40,
                      ),
                      AppTextButton(
                        backgroundColor: ColorsApp.primaryColor,
                        buttonText: "Apply",
                        textStyle: Styles.font16LightGreyMedium(context)
                            .copyWith(fontSize: 13),
                        onPressed: () {
                          validateThenDoAddVacation(context);
                        },
                      ),
                      ApplyVacationBlocListener(
                        title: title,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void validateThenDoAddVacation(BuildContext context) {
  if (BlocProvider.of<ApplyVacationCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<ApplyVacationCubit>(context).applyVacation();
  }
}
