import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/permissions/Permissions_of_specific_employee/data/models/GetPermissionOfSpecificEmployeeResponse.dart';
import 'package:erp_system/features/hr/permissions/update_permission/data/models/UpdatePermissionRequest.dart';
import 'package:erp_system/features/hr/permissions/update_permission/logic/update_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/update_permission/ui/widget/update_permission_bloc.dart';
import 'package:erp_system/features/hr/permissions/update_permission/ui/widget/update_permission_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePermissionBody extends StatelessWidget {
  const UpdatePermissionBody({super.key,required this.getPermissionOfSpecificEmployeeResponse});
 final GetPermissionOfSpecificEmployeeResponse getPermissionOfSpecificEmployeeResponse;
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
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: UpdatePermissionForm(
                        getPermissionOfSpecificEmployeeResponse: getPermissionOfSpecificEmployeeResponse,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: AppTextButton(
                        buttonText: 'Edit',
                        textStyle: Styles.font16LightGreyMedium(context),
                        backgroundColor: ColorsApp.primaryColor,
                        onPressed: () {
                          validateThenDoUpdatePermission(
                            context,
                            getPermissionOfSpecificEmployeeResponse.id as int,
                          );
                        },
                      ),
                    ),
                    const UpdatePermissionBloc(),
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
void validateThenDoUpdatePermission(BuildContext context, int id) {
  if (context.read<UpdatePermissionCubit>().formKey.currentState!.validate()) {
    context.read<UpdatePermissionCubit>().updatePermission(id);
  }
}
