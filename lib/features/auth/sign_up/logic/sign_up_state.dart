import 'package:erp_system/features/auth/sign_up/data/models/sign_up_response.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResponse signupResponse;

  SignupSuccess(this.signupResponse);
}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}
