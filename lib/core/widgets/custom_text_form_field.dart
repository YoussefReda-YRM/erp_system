import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focuseBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? isEnabled;
  final Function? function;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focuseBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.isEnabled,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: TextFormField(
        enabled: isEnabled ?? true,
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 20.w,
              ),
          focusedBorder: focuseBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsApp.primaryColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 253, 253, 253),
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: hintStyle ?? Styles.font14BlueSemiBold,
          hintText: hintText,
          prefix: prefixIcon,
          suffix: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsApp.moreLightGrey,
        ),
        obscureText: isObscureText ?? false,
        style: Styles.font14BlueSemiBold,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
