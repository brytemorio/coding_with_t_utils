import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

/// A versatile container widget for form layout, supporting rounded corners, shadows, loading states, and more.
class TFormContainer extends StatelessWidget {
  /// Creates a `full width` form container with flexible customization options.
  ///
  /// Parameters:
  /// - `width`: The width of the container.
  /// - `height`: The height of the container.
  /// - `radius`: The border radius for rounded corners.
  /// - `padding`: The internal padding of the container.
  /// - `margin`: The external margin around the container.
  /// - `backgroundColor`: The background color of the container.
  /// - `borderColor`: The color of the border.
  /// - `border`: Optional custom border for the container.
  /// - `showBorder`: Whether to display the border.
  /// - `showShadow`: Whether to display a shadow.
  /// - `shadow`: Optional custom shadow for the container.
  /// - `formAlignment`: Alignment for the container inside its parent.
  /// - `widthFactor`: Fractional width relative to the parent.
  /// - `maxWidth`: Maximum width for the container.
  /// - `isLoading`: Whether to show a loading indicator.
  /// - `loadingIndicatorColor`: The color of the loading indicator.
  /// - `child`: The widget to display inside the container.
  /// - `onTap`: Callback for tap gestures on the container.
  ///
  /// Note: Either use widthFactor or maxWidth. If widthFactor is being used then maxWidth will be not be effective.
  const TFormContainer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.border,
    this.showBorder = false,
    this.showShadow = false,
    this.shadow,
    this.formAlignment = Alignment.center,
    this.widthFactor,
    this.maxWidth,
    this.isLoading = false,
    this.fullWidth = false,
    this.loadingIndicatorColor,
    this.child,
    this.onTap,
  });

  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final BoxBorder? border;
  final bool showBorder;
  final bool showShadow;
  final BoxShadow? shadow;
  final Alignment formAlignment;
  final double? widthFactor;
  final double? maxWidth;
  final bool isLoading;
  final bool fullWidth;
  final Color? loadingIndicatorColor;
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.all(TSizes.md),
      constraints: maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
      decoration: BoxDecoration(
        color: backgroundColor ?? TColors.white,
        borderRadius: BorderRadius.circular(radius ?? TSizes.cardRadiusLg),
        border: showBorder ? border ?? Border.all(color: borderColor ?? TColors.borderPrimary) : null,
        boxShadow: showShadow
            ? [
                shadow ??
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
              ]
            : [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            Padding(
              padding: EdgeInsets.only(bottom: TSizes.sm),
              child: LinearProgressIndicator(color: loadingIndicatorColor ?? TColors.primary, minHeight: 2),
            ),
          child ?? const SizedBox.shrink(),
        ],
      ),
    );

    return Align(
      alignment: formAlignment,
      child: FractionallySizedBox(
        widthFactor: !fullWidth ? widthFactor ?? (TDeviceUtils.isDesktopScreen(context) ? 0.5 : null) : null,
        child: onTap != null ? GestureDetector(onTap: onTap, child: container) : container,
      ),
    );
  }
}
