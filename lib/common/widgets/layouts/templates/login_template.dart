import 'package:flutter/material.dart';

import '../../../../utils/exports.dart';
import '../../containers/t_container.dart';

/// Template for the login page layout.
/// Provides a reusable structure for a login page with responsiveness.
class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({
    super.key,
    required this.child,
    this.loginAnimation,
    this.footerText = 'Powered by Coding with T.',
    this.animationBackgroundColor,
    this.padding,
    this.margin,
    this.imageAsset = 'assets/loader.gif',
  });

  /// The widget to be displayed inside the login template (e.g., forms, buttons).
  final Widget child;

  /// Custom login animation (e.g., image or widget).
  final Widget? loginAnimation;

  /// Text to display in the footer, defaults to "Powered by Coding with T."
  final String footerText;

  /// Background color for the login animation, defaults to TColors.primary.
  final Color? animationBackgroundColor;

  /// Padding for the content area, can be customized.
  final EdgeInsets? padding;

  /// Margin for the content area, can be customized.
  final double? margin;

  /// Asset image for the login animation, defaults to 'assets/loader.gif'.
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: TDeviceUtils.getScreenWidth(context) * 0.9,
        height: TDeviceUtils.getScreenHeight(context) * 0.8,
        child: TContainer(
          // Add rounded corners to the main container.
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              // Display the custom login animation widget if provided, otherwise fallback.
              if (TDeviceUtils.isDesktopScreen(context))
                Expanded(child: _loginAnimationWidget(context)),

              // Display the content (e.g., login form) on the right side.
              Expanded(
                child: _buildContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the content (login form) on the right side of the screen.
  /// This widget is responsive and adjusts padding according to screen size.
  Widget _buildContent(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: TSizes.defaultSpace * 2,
            horizontal: TDeviceUtils.getScreenWidth(context) * 0.1,
          ),
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      child: SingleChildScrollView(child: child),
    );
  }

  /// Builds the login animation widget, shown on desktop screens.
  /// Includes an illustration and a footer text.
  TContainer _loginAnimationWidget(BuildContext context) {
    return TContainer(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(TSizes.borderRadiusLg),
        bottomLeft: Radius.circular(TSizes.borderRadiusLg),
      ),
      padding: const EdgeInsets.all(0),
      backgroundColor: animationBackgroundColor ?? TColors.primary,
      child: SizedBox(
        height: TDeviceUtils.getScreenHeight(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Use the custom login animation if provided, else fallback to default asset image.
            loginAnimation ?? _buildLoginImage(),

            // Add a footer text at the bottom.
            _buildFooterText(context),
          ],
        ),
      ),
    );
  }

  /// Reusable widget to build the login image.
  /// Can be easily customized to use different assets or animations.
  Widget _buildLoginImage() {
    return Image.asset(imageAsset, fit: BoxFit.none);
  }

  /// Reusable footer widget for displaying the footer text.
  Widget _buildFooterText(BuildContext context) {
    return Positioned(
      bottom: TSizes.defaultSpace,
      child: Text(
        footerText,
        style:
            Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),
      ),
    );
  }
}
