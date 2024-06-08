import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/logic/add_permission_cubit.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/ui/widget/add_permission_bloc.dart';
import 'package:erp_system/features/hr/permissions/add_permissions/ui/widget/add_permission_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddPermissionView extends StatelessWidget {
  const AddPermissionView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarApp(
            title: 'New Permission',
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
                      const AddPermissionForm(),
                      const SizedBox(
                        height: 40,
                      ),
                      AppTextButton(
                        backgroundColor: ColorsApp.primaryColor,
                        buttonText: "Create",
                        textStyle: Styles.font16LightGreyMedium(context)
                            .copyWith(fontSize: 13),
                        onPressed: () {
                          validateThenDoAddPermission(context);
                        },
                      ),
                      AddPermissionBloc(
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

void validateThenDoAddPermission(BuildContext context) {
  if (BlocProvider.of<AddPermissionCubit>(context)
      .formKey
      .currentState!
      .validate()) {
    BlocProvider.of<AddPermissionCubit>(context).addPermission();
  }
}
