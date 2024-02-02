import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/features/auth/login/data/models/login_request_body.dart';
import 'package:erp_system/features/auth/login/data/repos/login_repo.dart';
import 'package:erp_system/features/auth/login/logic/login_state.dart';
import 'package:erp_system/features/inventory/product/get_all_product/logic/get_all_product_cubit.dart';
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
      success: (loginResponse) {
        emit(LoginSuccess(loginResponse));
        // after successful login fetch all products
        getIt.get<GetAllProductCubit>().getAllProduct(loginResponse.token);
      },
      failure: (error) {
        emit(LoginFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  // void _fetchAllProducts(String? token) async {
  //   GetAllProductCubit getAllProductCubit = getIt<GetAllProductCubit>();
  //   getAllProductCubit.getAllProduct(token);
  // }
}
