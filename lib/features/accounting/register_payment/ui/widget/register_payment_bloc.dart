import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
import 'package:erp_system/core/utils/functions/setup_error_state.dart';
import 'package:erp_system/features/accounting/get_all_invoices/data/models/get_all_invoices_response.dart';
import 'package:erp_system/features/accounting/register_payment/logic/register_payment_cubit.dart';
import 'package:erp_system/features/accounting/register_payment/logic/register_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPaymentBloc extends StatelessWidget {
  const RegisterPaymentBloc(
      {super.key, required this.invoice, required this.supplierId});

  final GetAllInvoicesResponse invoice;
  final int supplierId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterPaymentCubit, RegisterPaymentState>(
      listenWhen: (previous, current) =>
          current is RegisterPaymentLoading ||
          current is RegisterPaymentSuccess ||
          current is RegisterPaymentFailure,
      listener: (context, state) {
        if (state is RegisterPaymentLoading) {
          customLoadingIndicator(context);
        } else if (state is RegisterPaymentSuccess) {
          // GoRouter.of(context).pop();
          Future.delayed(
            const Duration(
              milliseconds: 500,
            ),
            () {
              GoRouter.of(context).pushReplacement(
                AppRouter.kGetAllInvoicesOfSupplier,
                extra: supplierId,
              );
            },
          );
        } else if (state is RegisterPaymentFailure) {
          setupErrorState(context, state.error.toString());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
