import 'package:flutter/material.dart';

import '../../../utils/exports.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color.
  ///
  /// Properties are:
  /// Container [width], [height], & [backgroundColor].
  ///
  /// Icon's [size], [color] & [onPressed]
  const TCircularIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.iconColor = TColors.white,
    this.backgroundColor = TColors.secondary,
  });

  final IconData icon;
  final Color iconColor, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: const CircleBorder(),
      color: backgroundColor,
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: iconColor)),
    );
  }
}
