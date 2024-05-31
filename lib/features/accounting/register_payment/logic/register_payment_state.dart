import 'package:erp_system/features/accounting/register_payment/data/models/register_payment_response.dart';

abstract class RegisterPaymentState {}

class RegisterPaymentInitial extends RegisterPaymentState {}

class RegisterPaymentLoading extends RegisterPaymentState {}

class RegisterPaymentFailure extends RegisterPaymentState {
  final String error;

  RegisterPaymentFailure({required this.error});
}

class RegisterPaymentSuccess extends RegisterPaymentState {
  final RegisterPaymentResponse response;

  RegisterPaymentSuccess({
    required this.response,
  });
}
