import 'package:flutter/material.dart';
import 'package:news_app/core/utils/size_config.dart';

abstract class Styles {
  static TextStyle textStyle30SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontFamily: 'Poppins',
        height: 0.05,
        color: const Color(0xFFFBFCFF),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle18SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontFamily: 'Poppins',
        color: const Color(0xFFFBFCFF),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle20SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontFamily: 'Poppins',
        color: const Color(0xFFFBFCFF),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle22SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontFamily: 'Poppins',
        color: const Color(0xFFFBFCFF),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle12Regular(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontFamily: 'Poppins',
        color: const Color(0xFF858585),
        fontWeight: FontWeight.w400,
      );

  static TextStyle textStyle10Regular(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      );

  static TextStyle textStyle14Bold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  static TextStyle textStyle24Bold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  static TextStyle textStyle10Light(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.w300,
      );

  static TextStyle textStyle10SemiBold(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontFamily: 'Poppins',
        color: const Color(0xFFFEC158),
        fontWeight: FontWeight.w600,
      );

  static TextStyle textStyle12RegularDescription(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontFamily: 'Poppins',
        color: const Color(0xFFD9DAD3),
        fontWeight: FontWeight.w400,
        height: 0,
      );
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  // print("base fontSize= $fontSize lower=$lowerLimit h =$upperLimit");
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 400;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
