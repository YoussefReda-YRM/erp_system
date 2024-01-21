import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordChangedViewBody extends StatelessWidget {
  const PasswordChangedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.successMark),
        const SizedBox(
          height: 20,
        ),
        const HeadText(text: "Password Changed!"),
        const BodyText(text: "Your Password has been changed successfully."),
        const SizedBox(
          height: 50,
        ),
        AppTextButton(
          buttonText: "Back to Login",
          textStyle: Styles.font16LightGreyMedium,
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          },
        ),
      ],
    );
  }
}
