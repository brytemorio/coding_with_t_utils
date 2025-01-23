import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom circular icon widget with a configurable background color.
  ///
  /// - [icon] is the required icon to display.
  /// - [width] and [height] define the size of the container.
  /// - [size] specifies the size of the icon inside the container (default: TSizes.lg).
  /// - [color] sets the color of the icon.
  /// - [backgroundColor] sets the background color of the circular container.
  /// - [onPressed] defines the callback when the icon is pressed.
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = 24.0, // Default icon size
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  /// Width of the circular container.
  final double? width;

  /// Height of the circular container.
  final double? height;

  /// Size of the icon.
  final double? size;

  /// Icon to be displayed.
  final IconData icon;

  /// Color of the icon.
  final Color? color;

  /// Background color of the circular container.
  final Color? backgroundColor;

  /// Callback when the icon is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width ?? 48.0, // Default container width
      height: height ?? 48.0, // Default container height
      decoration: BoxDecoration(
        color: backgroundColor ??
            color?.withValues(alpha: 0.1) ??
            (isDarkMode ? Colors.black.withValues(alpha: 0.9) : Colors.white.withValues(alpha: 0.9)),
        borderRadius: BorderRadius.circular(100), // Ensures circular shape
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color ?? Theme.of(context).iconTheme.color, size: size),
      ),
    );
  }
}
