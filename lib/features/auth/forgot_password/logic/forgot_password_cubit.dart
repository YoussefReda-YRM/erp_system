import 'package:erp_system/features/auth/forgot_password/data/models/forgot_password_request_body.dart';
import 'package:erp_system/features/auth/forgot_password/data/repos/forgot_password_repo.dart';
import 'package:erp_system/features/auth/forgot_password/logic/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;
  ForgotPasswordCubit(this._forgotPasswordRepo,)
      : super(ForgotPasswrodInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  void forgotPassword() async {
    emit(ForgotPasswrodLoading());

    final response = await _forgotPasswordRepo.forgotPassword(
      ForgotPasswordRequestBody(
        phone: phoneController.text,
      ),
    );
    response.fold(
      (failure) {
        emit(
          ForgotPasswrodFailure(
            error: failure.errorMessage.toString(),
          ),
        );
      },
      (response) {
        emit(ForgotPasswrodSuccess(response));
      },
    );
  }
}
