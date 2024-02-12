import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'don\'t have an account?',
          style: Styles.font13LightGreyRegular(context),
        ),
        TextSpan(
          text: " Sign Up",
          style: Styles.font14BlueSemiBold(context)
              .copyWith(color: ColorsApp.moreLightGrey),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              GoRouter.of(context).pushReplacement(AppRouter.kSignupView);
            },
        ),
      ]),
    );
  }
}
