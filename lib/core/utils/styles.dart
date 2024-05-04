import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/font_weight_helper.dart';
import 'package:erp_system/core/utils/functions/responsive_font_size.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle font13GreyRegular(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeightHelper.regular,
        color: ColorsApp.grey,
      );

  static TextStyle font13BlueRegular(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeightHelper.regular,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font10BlueSemiBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font13LightGreyRegular(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeightHelper.regular,
        color: ColorsApp.lightGrey,
      );

  static TextStyle font13BlueSemiBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font13GreyMedium(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeightHelper.medium,
        color: ColorsApp.grey,
      );

  static TextStyle font14GreyRegular(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeightHelper.regular,
        color: ColorsApp.grey,
      );

  static TextStyle font14LightGreyRegular(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeightHelper.regular,
        color: ColorsApp.lightGrey,
      );

  static TextStyle font14DarkBlueMedium(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeightHelper.medium,
        color: ColorsApp.darkBlue,
      );

  static TextStyle font14BlueSemiBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font15DarkBlueMedium(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 15),
        fontWeight: FontWeightHelper.medium,
        color: ColorsApp.darkBlue,
      );

  static TextStyle font16LightGreyMedium(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeightHelper.medium,
        color: ColorsApp.lightGrey,
      );

  static TextStyle font24BlackBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeightHelper.bold,
        color: Colors.black,
      );

  static TextStyle font24LightGreyBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeightHelper.bold,
        color: ColorsApp.lightGrey,
      );

  static TextStyle font18LightGreyBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeightHelper.bold,
        color: ColorsApp.lightGrey,
      );

  static TextStyle font16DarkBlueBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeightHelper.bold,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font18DarkBlueBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeightHelper.bold,
        color: ColorsApp.primaryColor,
      );

  static TextStyle font32LightGreyBold(context) => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: getResponsiveFontSize(context, fontSize: 32),
        fontWeight: FontWeightHelper.bold,
        color: ColorsApp.lightGrey,
      );
}
