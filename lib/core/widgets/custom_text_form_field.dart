import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

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
  final TextInputType? keyboardType;
  final bool? readOnly;
  final int? maxLines;

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
    this.keyboardType,
    this.readOnly,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: TextFormField(
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        enabled: isEnabled ?? true,
        readOnly: readOnly ?? false,
        autocorrect: false,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
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
          hintStyle: hintStyle ?? Styles.font14BlueSemiBold(context),
          hintText: hintText,
          prefix: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsApp.moreLightGrey,
        ),
        obscureText: isObscureText ?? false,
        style: Styles.font14BlueSemiBold(context),
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
