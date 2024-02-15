import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 65.h,
      textStyle: Styles.font18DarkBlueBold(context),
      decoration: BoxDecoration(
        color: ColorsApp.moreLightGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Pinput(
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: ColorsApp.primaryColor),
          ),
        ),
        onCompleted: (pin) => debugPrint(pin),
      ),
    );
  }
}
