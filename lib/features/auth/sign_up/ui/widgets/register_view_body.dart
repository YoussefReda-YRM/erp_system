import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/cusotm_app_bar.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:erp_system/features/auth/terms_and_conditions_text.dart';
import 'package:erp_system/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:erp_system/features/auth/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:erp_system/features/auth/sign_up/ui/widgets/sign_up_bloc_listner.dart';
import 'package:erp_system/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const HeadText(
              text: 'Create Account',
            ),
            const BodyText(
              text:
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  const SignupForm(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: AppTextButton(
                      buttonText: "Create Account",
                      textStyle: Styles.font24DarkBlueBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: const TermsAndConditionsText(),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  const AlreadyHaveAccountText(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SignupBlocListener(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupState();
    }
  }
}
