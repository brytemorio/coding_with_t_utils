import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:t_utils/t_utils.dart';

class TAnimatedToggleSwitch extends StatelessWidget {
  /// A fully customizable animated toggle switch with dual states.
  ///
  /// Developers can control:
  /// - State (`current`)
  /// - Text, icon, and style builders
  /// - Customizable spacing, height, border width, and indicator size
  /// - Loading state
  /// - Colors for active and inactive states
  ///
  /// Example:
  /// ```dart
  /// TAnimatedToggleSwitch(
  ///   current: true,
  ///   onChanged: (value) {
  ///     print('Toggled to: $value');
  ///   },
  ///   activeColor: Colors.blue,
  ///   inactiveColor: Colors.grey,
  ///   spacing: 30.0,
  ///   height: 50.0,
  ///   borderWidth: 5.0,
  /// )
  /// ```
  /// Constructor for creating a fully customizable toggle switch.
  ///
  /// [current] determines the toggle's state.
  /// [onChanged] is a callback triggered when the state changes.
  /// Use [activeColor], [inactiveColor], [spacing], [height], and [borderWidth] to control styles.
  const TAnimatedToggleSwitch({
    super.key,
    required this.current,
    this.onChanged,
    this.textBuilder,
    this.iconBuilder,
    this.styleBuilder,
    this.height = 40.0,
    this.spacing = 50.0,
    this.loading = false,
    this.borderWidth = 7.0,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.indicatorSize = const Size.fromWidth(25),
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 1.5),
      )
    ],
  });

  /// The current state of the toggle switch (true/false).
  final bool current;

  /// Indicates whether the toggle switch is in a loading state.
  final bool loading;

  /// Callback triggered when the toggle switch state changes.
  final FutureOr<void> Function(bool)? onChanged;

  /// Builder for customizing the text displayed on the toggle switch.
  final Widget Function(bool)? textBuilder;

  /// Builder for customizing the icon displayed on the toggle switch.
  final Widget Function(bool)? iconBuilder;

  /// Builder for customizing the toggle's style dynamically.
  final ToggleStyle Function(bool)? styleBuilder;

  /// Color for the indicator in the active state.
  final Color? activeColor;

  /// Color for the indicator in the inactive state.
  final Color? inactiveColor;

  /// Space between the two toggle options.
  final double spacing;

  /// Height of the toggle switch.
  final double height;

  /// Border width of the toggle switch.
  final double borderWidth;

  /// Size of the indicator.
  final Size indicatorSize;

  /// Background color of the toggle switch.
  final Color backgroundColor;

  /// Border color of the toggle switch.
  final Color borderColor;

  /// Box shadow applied to the toggle switch.
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: current,
      first: true,
      second: false,
      height: height,
      loading: loading,
      spacing: spacing,
      onChanged: onChanged,
      borderWidth: borderWidth,
      indicatorSize: indicatorSize,

      // Default toggle switch style
      style: ToggleStyle(backgroundColor: backgroundColor, borderColor: borderColor, boxShadow: boxShadow),

      // Dynamic text builder
      textBuilder: textBuilder ??
          (value) => Center(
                child: Text(
                  value ? 'Active' : 'Inactive',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),

      // Dynamic icon builder
      iconBuilder: iconBuilder ?? (value) => value ? Icon(Icons.check_circle, color: TColors.primary) : Icon(Icons.circle_outlined),

      // Dynamic style builder for indicator color
      styleBuilder: styleBuilder ??
          (value) => ToggleStyle(indicatorColor: value ? activeColor ?? TColors.primaryBackground : inactiveColor ?? TColors.grey),
    );
  }
}
