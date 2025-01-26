import 'dart:ui';

import 'package:flutter/material.dart';

/// Custom Scroll Behavior to enable both touch and mouse devices for scrolling.
///
/// This class extends [MaterialScrollBehavior] and overrides the [dragDevices] getter to
/// explicitly specify that both touch and mouse devices can trigger scrolling.
/// This is useful for ensuring a consistent scrolling experience across
/// touchscreens and non-touch devices (e.g., desktops with a mouse).
///

/// Example usage:
///
/// To apply this custom scroll behavior globally in your app, you can set it in the MaterialApp
/// widget like this:
///
/// ```dart
/// MaterialApp(
///   scrollBehavior: MyCustomScrollBehavior(), // Apply custom scroll behavior
///   home: MyHomePage(),
/// );
/// ```

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override the dragDevices property to specify the input devices allowed for scrolling.
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch, // Allow touch input for scrolling.
        PointerDeviceKind.mouse, // Allow mouse input for scrolling.
      };
}
