import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        child: Text("Forgot Password?", style: Styles.font16LightGreyMedium),
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRouter.kForgotPasswordView);
        },
      ),
    );
  }
}
