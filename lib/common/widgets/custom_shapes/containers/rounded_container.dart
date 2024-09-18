import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

/// A container widget with rounded corners and customizable properties.
class TRoundedContainer extends StatelessWidget {
  /// Create a rounded container with customizable properties.
  ///
  /// Parameters:
  ///   - width: The width of the container.
  ///   - height: The height of the container.
  ///   - radius: The border radius for the rounded corners.
  ///   - padding: The padding inside the container.
  ///   - margin: The margin around the container.
  ///   - child: The widget to be placed inside the container.
  ///   - backgroundColor: The background color of the container.
  ///   - borderColor: The color of the container's border.
  ///   - showBorder: A flag to determine if the container should have a border.
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.border,
    this.showBorder = false,
    this.padding,
    this.borderColor,
    this.radius,
    this.backgroundColor,
  });

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderColor;
  final BoxBorder? border;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(TSizes.md),
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? TSizes.cardRadiusLg),
        border: showBorder ? border ?? Border.all(color: borderColor ?? TColors.borderPrimary) : null,
      ),
      child: child,
    );
  }
}
