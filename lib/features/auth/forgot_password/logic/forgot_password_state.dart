import 'package:erp_system/features/auth/forgot_password/data/models/forgot_password_response.dart';

abstract class ForgotPasswordState {}

class ForgotPasswrodInitial extends ForgotPasswordState {}

class ForgotPasswrodLoading extends ForgotPasswordState {}

class ForgotPasswrodSuccess extends ForgotPasswordState {
  final ForgotPasswordResponse forgotPasswordResponse;

  ForgotPasswrodSuccess(this.forgotPasswordResponse);
}

class ForgotPasswrodFailure extends ForgotPasswordState {
  final String error;

  ForgotPasswrodFailure({required this.error});
}
