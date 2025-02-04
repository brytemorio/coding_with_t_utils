import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/sizes.dart';

/// Utility class for device-related operations such as screen dimensions,
/// device type detection, system UI control, and device capabilities.
class TDeviceUtils {
  // Keyboard and Input Management

  /// Hides the keyboard by requesting focus on an empty node.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Returns the device's unique identifier (ID) based on platform.
  /// - Returns the iOS vendor identifier for iOS devices.
  /// - Returns the Android device ID for Android devices.
  /// - Returns the web browser name for web.
  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    } else if (kIsWeb) {
      var webDeviceInfo = await deviceInfo.webBrowserInfo;
      return webDeviceInfo.browserName.toString();
    }
    return null;
  }

  // Screen and Display Properties

  /// Returns the screen height of the current device.
  static double getScreenHeight(BuildContext? context) {
    return MediaQuery.of(context ?? Get.context!).size.height;
  }

  /// Returns the screen width of the current device.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the pixel ratio of the current device's display.
  static double getPixelRatio(BuildContext? context) {
    return MediaQuery.of(context ?? Get.context!).devicePixelRatio;
  }

  /// Returns the height of the status bar.
  static double getStatusBarHeight(BuildContext? context) {
    return MediaQuery.of(context ?? Get.context!).padding.top;
  }

  /// Returns the height of the bottom navigation bar.
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Returns the height of the app bar.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Returns the height of the keyboard.
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  // Orientation and UI Modes

  /// Sets the status bar color.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Enables or disables full-screen mode based on the [enable] parameter.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Returns true if the device is in landscape orientation.
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// Returns true if the device is in portrait orientation.
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// Sets the preferred screen orientations.
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hides the status bar.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Shows the status bar.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // Device Type and Capabilities

  /// Checks if the device is a physical Android or iOS device.
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Returns true if the device is an iOS device.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Returns true if the device is an Android device.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Internet Connection and Web

  /// Checks if the device has an active internet connection.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Launches a website using the provided URL.
  static void launchWebsiteUrl(String address) async {
    final Uri url = Uri.parse(address);
    if (!await launchUrl(url)) {
      if (kDebugMode) print('Could not launch $url');
    }
  }

  // Screen Size Detection

  /// Returns true if the device screen is large enough for desktop view.
  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= TSizes().desktopScreenSize;
  }

  /// Returns true if the device screen is large enough for tablet view but not desktop.
  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= TSizes().tabletScreenSize &&
        MediaQuery.of(context).size.width < TSizes().desktopScreenSize;
  }

  /// Returns true if the device screen is smaller than tablet size, i.e., mobile.
  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < TSizes().tabletScreenSize;
  }

  // Haptic Feedback

  /// Triggers a vibration for the given [duration].
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }
}
