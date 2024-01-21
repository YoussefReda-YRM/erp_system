import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/cusotm_app_bar.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/forgot_password/logic/forgot_password_cubit.dart';
import 'package:erp_system/features/auth/forgot_password/ui/widgets/forgot_password_bloc_listner.dart';
import 'package:erp_system/features/auth/forgot_password/ui/widgets/forgot_password_form.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:erp_system/features/auth/otp/ui/widgets/remember_pass_or_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const HeadText(
            text: "Forgot Password?",
          ),
          const BodyText(
            text:
                'Don\'t worry! It occurs. Please enter the phone number linked with your account.',
          ),
          SizedBox(
            height: 40.h,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ForgotPasswordForm(),
          ),
          SizedBox(
            height: 20.h,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextButton(
              buttonText: 'Send Code',
              textStyle: Styles.font24DarkBlueBold,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kOtpView);
                // validateThenDoForgotPassword(context);
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: RememberPasswordOrResendText(
              text: 'Remember Password? ',
              buttonText: 'Login',
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          const ForgotPasswordBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoForgotPassword(BuildContext context) {
    if (context.read<ForgotPasswordCubit>().formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().forgotPassword();
    }
  }
}
