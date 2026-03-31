import 'package:flutter/material.dart';

/// Compatibility shim for projects where the google_fonts package
/// cannot be compiled with the current toolchain.
class GoogleFonts {
  static TextTheme quicksandTextTheme([TextTheme? textTheme]) {
    return textTheme ?? const TextTheme();
  }

  static TextStyle quicksand({
    TextStyle? textStyle,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return (textStyle ?? const TextStyle()).copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
    );
  }
}