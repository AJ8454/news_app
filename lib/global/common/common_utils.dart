import 'package:flutter/material.dart';

class CommonUtils {
  //------------- colors ------------------
  static const kBlackColor = Color(0xFF000000);
  static const kWhiteColor = Color(0xFFffffff);
  static const kWhiteMColor = Color(0xFFf2f2f2);
  static const kWhiteLColor = Color(0xFFbababa);
  static const kGreyColor = Color(0xFF464646);

  //--------------------------------------

  static const kBorderRadius = 8.0;

  //-------------- Responsive utils -----------
  static double? height(BuildContext context) {
    double? size = MediaQuery.of(context).size.height;
    return size;
  }

  static double? width(BuildContext context) {
    double? size = MediaQuery.of(context).size.width;
    return size;
  }

  static double? dSize(BuildContext context) {
    double? size = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);
    return size;
  }

  static double? kminiFont(BuildContext context) {
    double? size = dSize(context)! * 12;
    return size;
  }

  static double? ksmallFont(BuildContext context) {
    double? size = dSize(context)! * 14;
    return size;
  }

  static double? kmediumFont(BuildContext context) {
    double? size = dSize(context)! * 16;
    return size;
  }

  static double? klargeFont(BuildContext context) {
    double? size = dSize(context)! * 18;
    return size;
  }

  static double? kextraLargeFont(BuildContext context) {
    double? size = dSize(context)! * 20;
    return size;
  }

  static double? kmaxExtraLargeFont(BuildContext context) {
    double? size = dSize(context)! * 22;
    return size;
  }

  static themeTextStyle(context,
          {double? letterSpacing,
          double? fsize,
          FontWeight? fweight,
          String? fontFamily,
          Color? tColor,
          TextOverflow? ovrflow = TextOverflow.ellipsis}) =>
      TextStyle(
        color: tColor ?? kWhiteColor,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? "RobotoSlab",
        fontSize:
            fsize != null ? dSize(context)! * fsize : kmediumFont(context),
        fontWeight: fweight,
      );
}
