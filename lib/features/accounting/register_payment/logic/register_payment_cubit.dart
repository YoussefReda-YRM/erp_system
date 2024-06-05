import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_request.dart';
import 'package:erp_system/features/accounting/register_payment/data/repos/register_payment_repo.dart';
import 'package:erp_system/features/accounting/register_payment/logic/register_payment_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPaymentCubit extends Cubit<RegisterPaymentState> {
  final RegisterPaymentRepo _registerPaymentRepo;
  RegisterPaymentCubit(this._registerPaymentRepo)
      : super(RegisterPaymentInitial());

  TextEditingController amountController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void registerPayments(int invoiceId, int supplierId) async {
    emit(RegisterPaymentLoading());
    final response = await _registerPaymentRepo.registerPayment(
      RegisterPaymentRequest(
        amount: int.parse(amountController.text),
        invoiceId: invoiceId,
        supplierId: supplierId,
      ),
    );
    response.when(
      success: (response) {
        emit(RegisterPaymentSuccess(response: response));
      },
      failure: (error) {
        emit(
          RegisterPaymentFailure(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
