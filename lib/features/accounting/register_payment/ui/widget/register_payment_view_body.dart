import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/data/models/get_all_invoices_of_supplier_response.dart';
import 'package:erp_system/features/accounting/register_payment/logic/register_payment_cubit.dart';
import 'package:erp_system/features/accounting/register_payment/ui/widget/register_payment_bloc.dart';
import 'package:erp_system/features/accounting/register_payment/ui/widget/register_payment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPaymentViewBody extends StatelessWidget {
  const RegisterPaymentViewBody(
      {super.key, required this.invoice, required this.supplierId});

  final GetAllInvoicesOfSupplierResponse invoice;
  final int supplierId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarApp(
          title: 'Register Payment',
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: CustomAppBody(
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: RegisterPaymentForm(),
                ),
                //  const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AppTextButton(
                    buttonText: 'Register Payment',
                    textStyle: Styles.font16LightGreyMedium(context),
                    backgroundColor: ColorsApp.primaryColor,
                    onPressed: () {
                      validateThenDoRegisterPayment(
                        context,
                        invoice.id,
                        supplierId,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                RegisterPaymentBloc(
                  invoice: invoice,
                  supplierId: supplierId,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

void validateThenDoRegisterPayment(
    BuildContext context, invoiceId, supplierId) {
  if (context.read<RegisterPaymentCubit>().formKey.currentState!.validate()) {
    context.read<RegisterPaymentCubit>().registerPayments(
          invoiceId,
          supplierId,
        );
  }
}
