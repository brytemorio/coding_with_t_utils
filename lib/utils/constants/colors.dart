import 'package:flutter/material.dart';

class TColors {
  static final TColors _instance = TColors._internal();

  factory TColors() => _instance;

  TColors._internal();

  // App theme colors
  Color primary = const Color(0xFF4b68ff);
  Color secondary = const Color(0xFFFFE24B);
  Color primaryBackground = const Color(0xFFBCDBF8);
  Color secondaryBackground = const Color(0xFDFFF6D7);
  Color accent = const Color(0xFFebedef);

  // Icon colors
  Color iconPrimary = const Color(0xFF8D8D8D);

  // Text colors
  Color textPrimary = const Color(0xFF222A3D);
  Color textSecondary = const Color(0xFF4B5363);
  Color textDarkPrimary = const Color(0xFFFFFFFF);
  Color textDarkSecondary = const Color(0xFFD1D5DB);
  Color textWhite = Colors.white;

  Color disabledTextLight = const Color(0xFFD1D5DB);
  Color disabledBackgroundLight = const Color(0xFFF3F4F6);

  Color disabledTextDark = const Color(0xFF4B5363);
  Color disabledBackgroundDark = const Color(0xFF222A3D);

  // Background colors
  Color lightBackground = const Color(0xFFEBEFF3);
  Color darkBackground = const Color(0xFF02040A);

  // Background Container colors
  Color lightContainer = const Color(0xFFF3F4F6);
  Color darkContainer = const Color(0xFF13192B);

  // Button colors
  Color buttonPrimary = const Color(0xFF4b68ff);
  Color buttonSecondary = const Color(0xFFFFE24B);
  Color buttonDisabled = const Color(0xFFF3F4F6);

  // Icon colors
  Color iconPrimaryLight = const Color(0xFF222A3D);
  Color iconSecondaryLight = const Color(0xFF9CA3AF);
  Color iconPrimaryDark = const Color(0xFFFFFFFF);
  Color iconSecondaryDark = const Color(0xFF9CA3AF);

  // Border colors
  Color borderPrimary = const Color(0xFF4b68ff);
  Color borderSecondary = const Color(0xFFFFE24B);
  Color borderLight = const Color(0xFFD1D5DB);
  Color borderDark = const Color(0xFF9CA3AF);

  // Error and validation colors
  Color error = const Color(0xFFD32F2F);
  Color success = const Color(0xFF388E3C);
  Color warning = const Color(0xFFF57C00);
  Color info = const Color(0xFF1976D2);

  // Neutral Shades
  Color black = const Color(0xFF232323);
  Color darkerGrey = const Color(0xFF4F4F4F);
  Color darkGrey = const Color(0xFF939393);
  Color grey = const Color(0xFFE0E0E0);
  Color softGrey = const Color(0xFFF4F4F4);
  Color lightGrey = const Color(0xFFF9F9F9);
  Color white = const Color(0xFFFFFFFF);

  // Optional initializer: users can set only the colors they want to override
  TColors init({
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

    return this;
  }
}
