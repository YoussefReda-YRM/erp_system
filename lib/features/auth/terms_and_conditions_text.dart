import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "By logging, you agree to our ",
          style: Styles.font13GreyMedium(context),
        ),
        TextSpan(
          text: "Terms & Conditions",
          style: Styles.font13LightGreyRegular(context),
        ),
        TextSpan(
          text: " and ",
          style: Styles.font13GreyMedium(context),
        ),
        TextSpan(
          text: "Privacy Policy",
          style: Styles.font13LightGreyRegular(context),
        )
      ]),
    );
  }
}
