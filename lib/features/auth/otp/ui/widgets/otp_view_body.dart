import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/cusotm_app_bar.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/auth/body_text.dart';
import 'package:erp_system/features/auth/head_text.dart';
import 'package:erp_system/features/auth/otp/ui/widgets/pinput_widget.dart';
import 'package:erp_system/features/auth/otp/ui/widgets/remember_pass_or_resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const HeadText(text: "OTP Verification"),
        const BodyText(
            text:
                "Enter the verification code we just sent on your phone number"),
        const PinputWidget(),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppTextButton(
            buttonText: "Submit",
            textStyle: Styles.font24DarkBlueBold,
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.kCreateNewPasswordView);
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        const Center(
          child: RememberPasswordOrResendText(
            text: 'Didn\'t received code? ',
            buttonText: 'Resend',
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
