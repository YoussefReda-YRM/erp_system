import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/department/update_department/logic/update_department_cubit.dart';
import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_bloc_listener.dart';
import 'package:erp_system/features/hr/department/update_department/ui/widget/update_department_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDepartmentBody extends StatelessWidget {
  final int id;
  const UpdateDepartmentBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomAppBarApp(
            title: 'Edit Department',
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
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: UpdateDepartmentForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: AppTextButton(
                        buttonText: 'Edit',
                        textStyle: Styles.font16LightGreyMedium(context),
                        backgroundColor: ColorsApp.primaryColor,
                        onPressed: () {
                          validateThenDoUpdateDepartment(context, id);
                          // context
                          //     .read<UpdateParentCategoryCubit>()
                          //     .updateparentcategory(parentId);
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
      ),
    );
  }
}

void validateThenDoUpdateDepartment(BuildContext context, int id) {
  if (context.read<UpdateDepartmentCubit>().formKey.currentState!.validate()) {
    context.read<UpdateDepartmentCubit>().updateDepartment(id);
  }
}
