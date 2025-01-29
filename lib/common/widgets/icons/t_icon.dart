import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TIcon extends StatelessWidget {
  /// A custom icon button widget with configurable shape and background color.
  ///
  /// - [icon] is the required icon to display.
  /// - [width] and [height] define the size of the container.
  /// - [size] specifies the size of the icon inside the container (default: 18.0).
  /// - [color] sets the color of the icon.
  /// - [backgroundColor] sets the background color of the container.
  /// - [onPressed] defines the callback when the icon is pressed.
  /// - [borderRadius] allows custom shaping of the container (default: circular).
  const TIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.borderRadius = 100.0,
  });

  /// Width of the container.
  final double? width;

  /// Height of the container.
  final double? height;

  /// Size of the icon.
  final double? size;

  /// Icon to be displayed.
  final IconData icon;

  /// Color of the icon.
  final Color? color;

  /// Background color of the container.
  final Color? backgroundColor;

  /// Callback when the icon is pressed.
  final VoidCallback? onPressed;

  /// Radius for shaping the container. Default is circular.
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDarkMode ? Colors.black.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color ?? Theme.of(context).primaryColor,
          size: size ?? TSizes.md,
        ),
      ),
    );
  }
}
