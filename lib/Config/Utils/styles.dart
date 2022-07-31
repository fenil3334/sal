import 'package:flutter/material.dart';
import 'package:salon_secret/Config/Helper/SizeConfige.dart';
import 'package:salon_secret/Config/Utils/color.dart';

String fontFamily = "Poppins";

TextStyle lightTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w300,
  fontFamily: fontFamily
);

TextStyle regularTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
  fontSize: fontSize.sp,
  color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily
);

TextStyle mediumTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily
);

TextStyle semiBoldTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily
);

TextStyle boldTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily
);

TextStyle extraBoldTextStyle({double fontSize = 14,Color? txtColor})=>TextStyle(
    fontSize: fontSize.sp,
    color: txtColor ?? AppColors.BLACK,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily
);