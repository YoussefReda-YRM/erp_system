import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RememberPasswordOrResendText extends StatelessWidget {
  const RememberPasswordOrResendText({
    super.key,
    required this.text,
    required this.buttonText,
    this.onPressed,
  });
  final String text;
  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: text,
          style: Styles.font13LightGreyRegular,
        ),
        TextSpan(
            text: buttonText,
            style: Styles.font14BlueSemiBold
                .copyWith(color: ColorsApp.moreLightGrey),
            recognizer: TapGestureRecognizer()..onTap = onPressed),
      ]),
    );
  }
}
