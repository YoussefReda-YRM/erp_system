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

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController employeeJobController = TextEditingController();

  TextEditingController roleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signup() async {
    emit(SignupLoading());
    final response = await _signupRepo.signup(SignupRequestBody(
      userName: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: passwordConfirmationController.text,
      employeeJop: employeeJobController.text,
      addedById: '047b4ddb-4289-49d0-9ce4-da3aeb3f363d',
      employeeDepartmentId: '2',
      role: roleController.text,
    ));
    response.when(
      success: (loginResponse) {
        emit(SignupSuccess(loginResponse));
      },
      failure: (error) {
        emit(SignupFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
