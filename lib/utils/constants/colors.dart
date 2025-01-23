import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static Color primary = const Color(0xFF4b68ff);
  static Color secondary = const Color(0xFFFFE24B);
  static Color primaryBackground = const Color(0xFFBCDBF8);
  static Color secondaryBackground = const Color(0xFDFFF6D7);
  static Color accent = const Color(0xFFebedef);

  // Icon colors
  static Color iconPrimary = const Color(0xFF8D8D8D);

  // Text colors
  static Color textPrimary = const Color(0xFF222A3D);
  static Color textSecondary = const Color(0xFF4B5363);
  static Color textDarkPrimary = const Color(0xFFFFFFFF);
  static Color textDarkSecondary = const Color(0xFFD1D5DB);
  static Color textWhite = Colors.white;

  static Color disabledTextLight = const Color(0xFFD1D5DB);
  static Color disabledBackgroundLight = const Color(0xFFF3F4F6);

  static Color disabledTextDark = textSecondary;
  static Color disabledBackgroundDark = const Color(0xFF222A3D);

  // Background colors
  static Color lightBackground = const Color(0xFFEBEFF3);
  static Color darkBackground = const Color(0xFF02040A);

  // Background Container colors
  static Color lightContainer = const Color(0xFFF3F4F6);
  static Color darkContainer = const Color(0xFF13192B);

  // Button colors
  static Color buttonPrimary = primary;
  static Color buttonSecondary = secondary;
  static Color buttonDisabled = disabledBackgroundLight;

  // Icon colors
  static Color iconPrimaryLight = const Color(0xFF222A3D);
  static Color iconSecondaryLight = const Color(0xFF9CA3AF);
  static Color iconPrimaryDark = const Color(0xFFFFFFFF);
  static Color iconSecondaryDark = const Color(0xFF9CA3AF);

  // Border colors
  static Color borderPrimary = primary;
  static Color borderSecondary = secondary;
  static Color borderLight = const Color(0xFFD1D5DB);
  static Color borderDark = const Color(0xFF9CA3AF);

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
    Color? primaryBackgroundColor,
    Color? secondaryBackgroundColor,
    Color? lightBackgroundColor,
    Color? darkBackgroundColor,
    Color? lightContainerColor,
    Color? darkContainerColor,
    Color? buttonPrimaryColor,
    Color? buttonSecondaryColor,
    Color? buttonDisabledColor,
    Color? iconPrimaryColor,
    Color? iconPrimaryLightColor,
    Color? iconSecondaryLightColor,
    Color? iconPrimaryDarkColor,
    Color? iconSecondaryDarkColor,
    Color? borderPrimaryColor,
    Color? borderSecondaryColor,
    Color? borderLightColor,
    Color? borderDarkColor,
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
    primaryBackground = primaryBackgroundColor ?? primaryBackground;
    secondaryBackground = secondaryBackgroundColor ?? secondaryBackground;
    lightBackground = lightBackgroundColor ?? lightBackground;
    darkBackground = darkBackgroundColor ?? darkBackground;
    lightContainer = lightContainerColor ?? lightContainer;
    darkContainer = darkContainerColor ?? darkContainer;
    buttonPrimary = buttonPrimaryColor ?? buttonPrimary;
    buttonSecondary = buttonSecondaryColor ?? buttonSecondary;
    buttonDisabled = buttonDisabledColor ?? buttonDisabled;
    iconPrimary = iconPrimaryColor ?? iconPrimary;
    iconPrimaryLight = iconPrimaryLightColor ?? iconPrimaryLight;
    iconSecondaryLight = iconSecondaryLightColor ?? iconSecondaryLight;
    iconPrimaryDark = iconPrimaryDarkColor ?? iconPrimaryDark;
    iconSecondaryDark = iconSecondaryDarkColor ?? iconSecondaryDark;
    borderPrimary = borderPrimaryColor ?? borderPrimary;
    borderSecondary = borderSecondaryColor ?? borderSecondary;
    borderLight = borderLightColor ?? borderLight;
    borderDark = borderDarkColor ?? borderDark;
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
