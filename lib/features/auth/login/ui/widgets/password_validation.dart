import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinLength;
  final BuildContext context;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinLength, required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase latter', hasLowerCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 uppercase latter', hasUpperCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 number', hasNumber),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsApp.grey,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: Styles.font13LightGreyRegular(context).copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated
                ? ColorsApp.moreLightGrey
                : ColorsApp.moreLightGrey,
          ),
        ),
      ],
    );
  }
}
