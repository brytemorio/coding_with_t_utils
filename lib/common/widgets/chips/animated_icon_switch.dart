import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';


class TIconToggleSwitch<T> extends StatelessWidget {

  /// A customizable rolling icon toggle switch.
  ///
  /// Features:
  /// - Allows customization of dimensions, spacing, and styles.
  /// - Handles a list of options and their corresponding icons.
  /// - Optional loading state and dynamic style customization.
  ///
  /// Example Usage:
  /// ```dart
  /// TIconToggleSwitch<int>(
  ///   current: 1,
  ///   options: [0, 1],
  ///   icons: [Icons.light_mode, Icons.dark_mode],
  ///   onChanged: (value) {
  ///     print('Selected: $value');
  ///   },
  ///   spacing: 20.0,
  ///   height: 50.0,
  /// )
  /// ```
  ///
  /// Constructs a customizable toggle switch with icons.
  ///
  /// [current] is the currently selected value.
  /// [options] is the list of selectable values.
  /// [icons] provides the icons corresponding to the values.
  const TIconToggleSwitch({
    super.key,
    required this.current,
    required this.options,
    required this.icons,
    this.onChanged,
    this.spacing = 14.0,
    this.height = 40.0,
    this.iconSize = 24.0,
    this.borderWidth = 6.0,
    this.indicatorWidth = 25.0,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.loading = false,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 1.5),
      ),
    ],
    this.styleBuilder,
  });

  /// The currently selected value.
  final T current;

  /// Whether the toggle switch is in a loading state.
  final bool loading;

  /// List of selectable options (values).
  final List<T> options;

  /// List of icons corresponding to the options.
  final List<IconData> icons;

  /// Callback triggered when the selected option changes.
  final void Function(T)? onChanged;

  /// Spacing between toggle options.
  final double spacing;

  /// Height of the toggle switch.
  final double height;

  /// Size of the icons.
  final double iconSize;

  /// Border width of the toggle switch.
  final double borderWidth;

  /// Width of the indicator.
  final double indicatorWidth;

  /// Color for the active indicator/icon.
  final Color? activeColor;

  /// Color for inactive icons.
  final Color? inactiveColor;

  /// Background color of the toggle switch.
  final Color backgroundColor;

  /// Border color of the toggle switch.
  final Color borderColor;

  /// Box shadow applied to the toggle switch.
  final List<BoxShadow> boxShadow;

  /// Optional style builder for customizing the toggle switch.
  final ToggleStyle Function(T)? styleBuilder;

  @override
  Widget build(BuildContext context) {
    // Ensure the options and icons lists have matching lengths.
    assert(options.length == icons.length, 'The number of options and icons must match.');

    return AnimatedToggleSwitch<T>.rolling(
      current: current,
      height: height,
      borderWidth: borderWidth,
      values: options,
      loading: loading,
      spacing: spacing,
      onChanged: onChanged,
      indicatorSize: Size.fromWidth(indicatorWidth),

      // Builds the icon for each toggle state dynamically.
      iconBuilder: (t, isSelected) {
        int index = options.indexOf(t);
        return Icon(
          icons[index],
          color: t == current ? activeColor ?? TColors.primary : inactiveColor ?? Colors.grey,
          size: iconSize,
        );
      },

      // Builds the style dynamically or uses a fallback.
      styleBuilder: styleBuilder ??
          (value) => ToggleStyle(
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                indicatorColor: activeColor ?? TColors.primaryBackground,
                indicatorBorderRadius: BorderRadius.circular(100),
                boxShadow: boxShadow,
              ),
    );
  }
}
