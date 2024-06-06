import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/logic/add_taxes_cubit.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/ui/widget/add_taxes_bloc.dart';
import 'package:erp_system/features/accounting/taxes/add_taxes/ui/widget/add_taxes_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaxesBody extends StatelessWidget {
  const AddTaxesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Add Taxes',
          iconLeading: CustomBackButton(),
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
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: AddTaxesForm(),
                  ),
                  //  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppTextButton(
                      buttonText: 'Add',
                      textStyle: Styles.font16LightGreyMedium(context),
                      backgroundColor: ColorsApp.primaryColor,
                      onPressed: () {
                        validateThenDoAddTaxes(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
                  const AddTaxesBloc(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void validateThenDoAddTaxes(BuildContext context) {
  if (context.read<AddTaxesCubit>().formKey.currentState!.validate()) {
    context.read<AddTaxesCubit>().addTaxes();
  }
}
