import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static Color primary = const Color(0xFF33ba78);
  static Color secondary = const Color(0xFF5b68f6);
  static Color accent = const Color(0xFFebedef);

  // Text colors
  static Color textPrimary = const Color(0xFF333333);
  static Color textSecondary = const Color(0xFF6C757D);
  static Color textWhite = Colors.white;

  // Background colors
  static Color light = const Color(0xFFF6F6F6);
  static Color dark = const Color(0xFF272727);
  static Color primaryBackground = const Color(0xFFF3F5FF);

  // Background Container colors
  static Color lightContainer = const Color(0xFFF6F6F6);
  static Color darkContainer = const Color(0xFFFFFFFF).withOpacity(0.1);

  // Button colors
  static Color buttonPrimary = const Color(0xFF4b68ff);
  static Color buttonSecondary = const Color(0xFF6C757D);
  static Color buttonDisabled = const Color(0xFFC4C4C4);

  // Border colors
  static Color borderPrimary = const Color(0xFFD9D9D9);
  static Color borderSecondary = const Color(0xFFE6E6E6);

  // Error and validation colors
  static Color error = const Color(0xFFD32F2F);
  static Color success = const Color(0xFF388E3C);
  static Color warning = const Color(0xFFF57C00);
  static Color info = const Color(0xFF1976D2);

  // Neutral Shades
  static Color black = const Color(0xFF232323);
  static Color darkerGrey = const Color(0xFF4F4F4F);
  static Color darkGrey = const Color(0xFF939393);
  static Color grey = const Color(0xFFE0E0E0);
  static Color softGrey = const Color(0xFFF4F4F4);
  static Color lightGrey = const Color(0xFFF9F9F9);
  static Color white = const Color(0xFFFFFFFF);

  // Optional initializer: users can set only the colors they want to override
  static void init({
    Color? primaryColor,
    Color? secondaryColor,
    Color? accentColor,
    Color? textPrimaryColor,
    Color? textSecondaryColor,
    Color? textWhiteColor,
    Color? lightColor,
    Color? darkColor,
    Color? primaryBackgroundColor,
    Color? lightContainerColor,
    Color? darkContainerColor,
    Color? buttonPrimaryColor,
    Color? buttonSecondaryColor,
    Color? buttonDisabledColor,
    Color? borderPrimaryColor,
    Color? borderSecondaryColor,
    Color? errorColor,
    Color? successColor,
    Color? warningColor,
    Color? infoColor,
    Color? blackColor,
    Color? darkerGreyColor,
    Color? darkGreyColor,
    Color? greyColor,
    Color? softGreyColor,
    Color? lightGreyColor,
    Color? whiteColor,
  }) {
    // Assign values only if provided, otherwise use the default values
    primary = primaryColor ?? primary;
    secondary = secondaryColor ?? secondary;
    accent = accentColor ?? accent;
    textPrimary = textPrimaryColor ?? textPrimary;
    textSecondary = textSecondaryColor ?? textSecondary;
    textWhite = textWhiteColor ?? textWhite;
    light = lightColor ?? light;
    dark = darkColor ?? dark;
    primaryBackground = primaryBackgroundColor ?? primaryBackground;
    lightContainer = lightContainerColor ?? lightContainer;
    darkContainer = darkContainerColor ?? darkContainer;
    buttonPrimary = buttonPrimaryColor ?? buttonPrimary;
    buttonSecondary = buttonSecondaryColor ?? buttonSecondary;
    buttonDisabled = buttonDisabledColor ?? buttonDisabled;
    borderPrimary = borderPrimaryColor ?? borderPrimary;
    borderSecondary = borderSecondaryColor ?? borderSecondary;
    error = errorColor ?? error;
    success = successColor ?? success;
    warning = warningColor ?? warning;
    info = infoColor ?? info;
    black = blackColor ?? black;
    darkerGrey = darkerGreyColor ?? darkerGrey;
    darkGrey = darkGreyColor ?? darkGrey;
    grey = greyColor ?? grey;
    softGrey = softGreyColor ?? softGrey;
    lightGrey = lightGreyColor ?? lightGrey;
    white = whiteColor ?? white;
  }
}
