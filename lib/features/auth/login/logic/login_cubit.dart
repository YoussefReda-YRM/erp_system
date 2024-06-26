import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/helpers/shared_pref_helper.dart';
import 'package:erp_system/core/networking/dio_factory.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    emit(LoginLoading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token!);
        await saveUserData(
          loginResponse.userData!.role!,
          loginResponse.userData!.userID!,
          loginResponse.userData!.name!,
        );

        userRole =
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.userRole);

        userName =
            await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);

        userId = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);

        emit(LoginSuccess(loginResponse));
      },
      failure: (error) {
        emit(LoginFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveUserData(String role, String id, String name) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userRole, role);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userId, id);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userName, name);
  }
}
