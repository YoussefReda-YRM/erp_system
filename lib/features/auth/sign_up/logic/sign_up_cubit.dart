import 'package:erp_system/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:erp_system/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupState() async {
    emit(SignupLoading());
    final response = await _signupRepo.signup(SignupRequestBody(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      gender: 0,
    ));
    response.fold(
      (failure) {
        emit(SignupFailure(error: failure.errorMessage.toString()));
      },
      (response) {
        emit(SignupSuccess(response));
      },
    );
  }
}
