import 'package:flutter/material.dart';
import 'package:tic_tac_toe/design/colors.design.dart';

///
/// Predefined text styles according to app's Design System
///
class DesignTextStyles {
  ///
  /// Display Font
  ///
  static const TextStyle array = TextStyle(
    color: DesignColors.primary,
    fontFamily: 'Array',
    fontWeight: FontWeight.w400,
    height: 0.01,
  );

  ///
  /// Sans-Serif Font
  ///
  static const TextStyle dmSans = TextStyle(
    color: DesignColors.primary,
    fontFamily: 'Dm Sans',
    fontWeight: FontWeight.w400,
    height: 1,
  );

  static TextStyle get title => array.copyWith(fontSize: 72);

  static TextStyle get heading1 => array.copyWith(fontSize: 52);

  static TextStyle get heading2 => array.copyWith(fontSize: 40);

  static TextStyle get body1 => dmSans.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 0.06,
      );

  static TextStyle get body2 => dmSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 0.08,
      );

  static TextStyle get text1 => dmSans.copyWith(
        fontSize: 16,
        height: 0.09,
      );

  static TextStyle get text2 => dmSans.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 0.11,
      );
}