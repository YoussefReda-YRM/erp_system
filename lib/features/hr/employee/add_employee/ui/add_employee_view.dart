import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/hr/employee/add_employee/logic/add_employee_cubit.dart';
import 'package:erp_system/features/hr/employee/add_employee/ui/widgets/add_employee_bloc_listnere.dart';
import 'package:erp_system/features/hr/employee/add_employee/ui/widgets/add_employee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddEmployeeView extends StatelessWidget {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarApp(
            title: 'New Employee',
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
                      const AddEmployeeForm(),
                      const SizedBox(
                        height: 40,
                      ),
                      AppTextButton(
                        backgroundColor: ColorsApp.primaryColor,
                        buttonText: "Create",
                        textStyle: Styles.font16LightGreyMedium(context)
                            .copyWith(fontSize: 13),
                        onPressed: () {
                          validateThenDoAddEmployee(context);
                        },
                      ),
                      const AddEmployeeBlocListener(),
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

void validateThenDoAddEmployee(BuildContext context) {
  if (BlocProvider.of<AddEmployeeCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<AddEmployeeCubit>(context).addEmployee();
  }
}
