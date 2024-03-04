import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/functions/delete_show_dialog.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_text_form_field.dart';
import 'package:erp_system/features/hr/employee/get_all_employees/logic/get_all_employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditAndDeleteButton extends StatelessWidget {
  const EditAndDeleteButton({
    super.key,
    required this.size,
    required this.employeeId,
  });

  final Size size;
  final String employeeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppTextButton(
          buttonText: "Edit",
          width: MediaQuery.of(context).size.width / 2.5,
          backgroundColor: Colors.green,
          textStyle: Styles.font13BlueSemiBold(context),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kUpdateEmployeeView);
          },
        ),
        const Spacer(),
        AppTextButton(
          buttonText: "Delete",
          width: MediaQuery.of(context).size.width / 2.5,
          backgroundColor: Colors.red,
          textStyle: Styles.font13BlueSemiBold(context),
          onPressed: () {
            deleteShowDialog(
              context,
              'Are you sure you want to delete this Employee?',
              () {
                getIt.get<GetAllEmployeeCubit>().deleteEmployee(
                      employeeId,
                    );
                GoRouter.of(context).pop();
                Future.delayed(const Duration(milliseconds: 200), () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kAllEmployeesView);
                });
              },
            );
          },
        ),
      ],
    );
  }
}

showEditProductDialog(BuildContext context, Size size) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text(
          'Edit Product',
          style:
              Styles.font14BlueSemiBold(context).copyWith(color: Colors.pink),
        ),
        content: SizedBox(
          width: size.width * 0.9,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AppTextFormField(
                  hintText: 'product name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'cateogry name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'on hand',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'in come',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'out going',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'cost price',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextFormField(
                  hintText: 'sale price',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsApp.primaryColor,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextButton(
                  buttonText: "Save",
                  backgroundColor: ColorsApp.primaryColor,
                  textStyle: Styles.font13LightGreyRegular(context),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.pink),
            ),
          )
        ],
      );
    },
  );
}
