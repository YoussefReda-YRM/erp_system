import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/cusotm_app_bar.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:erp_system/features/auth/login/logic/login_cubit.dart';
import 'package:erp_system/features/auth/login/ui/widgets/email_and_password.dart';
import 'package:erp_system/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:erp_system/features/auth/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const HeadText(
              text: 'Welcome Back',
            ),
            const BodyText(
              text:
                  'We\'re exited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: EmailAndPassword(),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppTextButton(
                    buttonText: "Login",
                    textStyle: Styles.font13BlueSemiBold(context),
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TermsAndConditionsText(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const LoginBlocListener(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
