import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_utils/common/widgets/exports.dart';
import 'package:t_utils/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

/// A customizable AppBar widget designed for consistent styling and flexibility.
///
/// The [TAppBar] widget allows for the creation of a styled AppBar with options to:
/// - Display a title, with customizable [titleStyle].
/// - Show or hide a back arrow via [showBackArrow].
/// - Provide a custom leading icon and its press callback through [leadingIcon] and [leadingOnPressed].
/// - Add a list of action widgets with [actions].
/// - Adjust horizontal padding using [padding].
///
/// Example usage:
/// ```dart
/// CustomAppBar(
///   title: Text('Page Title'),
///   showBackArrow: true,
///   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
/// )
/// ```
class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title widget for the AppBar. Can be any widget, such as [Text] or [Row].
  final Widget? title;

  /// Determines if a back arrow is shown on the leading side of the AppBar.
  final bool showBackArrow;

  /// A custom widget as a leading widget.
  final Widget? leading;

  /// A custom icon to replace the default back arrow.
  final IconData? leadingIcon;
  final Color? leadingIconColor;

  /// Callback for the leading icon's press event.
  final VoidCallback? leadingOnPressed;

  /// List of widgets displayed on the trailing side of the AppBar.
  final List<Widget>? actions;

  /// Custom text style for the title.
  final TextStyle? titleStyle;

  /// Padding applied around the AppBar's content.
  final EdgeInsetsGeometry? padding;

  /// Background color of the AppBar.
  final Color? backgroundColor;

  /// Creates a customizable AppBar.
  ///
  /// - [showBackArrow] defaults to `false` and toggles the visibility of the back arrow.
  /// - [padding] defaults to `EdgeInsets.symmetric(horizontal: 16.0)`.
  const TAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.actions,
    this.leading,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is in dark mode.
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: TSizes().defaultSpace),
        child: AppBar(
          backgroundColor: backgroundColor ?? (isDarkMode ? TColors().darkBackground : TColors().white),
          automaticallyImplyLeading: false,
          // Prevents default back arrow rendering.
          leading: showBackArrow
              ? TIcon(icon: Iconsax.arrow_left, color: leadingIconColor, onPressed: () => Navigator.pop(context))
              : leading ??
        (leadingIcon != null
        ? IconButton(
        onPressed: leadingOnPressed,
          icon: Icon(
            leadingIcon,
            color: leadingIconColor ?? (isDarkMode ? TColors().iconPrimaryLight : TColors().iconPrimaryDark),
          ),
        )
            : null),
    title: title != null
    ? DefaultTextStyle.merge(
    style: titleStyle ??
    TextStyle(
    color: isDarkMode ? TColors().white : TColors().textPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    ),
    child: title!,
    )
        : null,
    actions: actions,
    ),
    );
  }

  /// Specifies the preferred height of the AppBar.
  ///
  /// The height is determined dynamically using [TDeviceUtils.getAppBarHeight()]
  /// to ensure consistency across devices.
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
