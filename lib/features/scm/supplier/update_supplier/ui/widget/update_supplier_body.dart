import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/logic/update_supplier_cubit.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/ui/widget/update_supplier_bloc_listener.dart';
import 'package:erp_system/features/scm/supplier/update_supplier/ui/widget/update_supplier_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSupplierBody extends StatelessWidget {
  final int id;
  const UpdateSupplierBody({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Edit supplier',
          iconLeading: CustomBackButton(),
        ),
        CustomAppBody(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const UpdateSupplierForm(),
                 const SizedBox(
                  height: 20,
                ),
                AppTextButton(
                  buttonText: 'Save',
                  textStyle: Styles.font16LightGreyMedium(context),
                  backgroundColor: ColorsApp.primaryColor,
                  onPressed: () {
                    validateThenDoUpdateSupplier(context, id);
                  },
                ),
                const UpdateSupplierBlocListener(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoUpdateSupplier(BuildContext context, int id) {
  if (context.read<UpdateSupplierCubit>().formKey.currentState!.validate()) {
    context.read<UpdateSupplierCubit>().updateSupplier(id);
  }
}
