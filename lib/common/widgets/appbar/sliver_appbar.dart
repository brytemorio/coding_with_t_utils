import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TSliverAppBar extends StatelessWidget {
  /// A customizable and flexible SliverAppBar with scrolling effects.
  ///
  /// This widget provides advanced app bar functionality with options to:
  /// - Customize the title using [title] and its style via [titleStyle].
  /// - Show a back arrow using [showBackArrow], or use a custom icon with [leadingIcon].
  /// - Provide a callback for the leading icon press event with [leadingOnPressed].
  /// - Add action buttons using the [actions] parameter.
  /// - Control the expanded height of the app bar with [expandedHeight].
  /// - Add custom content when the app bar is expanded using [flexibleSpace].
  /// - Set a custom background using [background].
  /// - Control scrolling behavior with [floating], [pinned], and [snap].
  ///
  /// Note: If both [title] and a `FlexibleSpaceBar.title` are provided,
  /// both titles will be displayed simultaneously when scrolling. To avoid redundancy,
  /// prefer providing only one title source.
  const TSliverAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.expandedHeight = 200.0,
    this.flexibleSpace,
    this.background,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.useTitleInFlexibleSpace = true,
    this.backgroundColor,
  });

  /// The main title of the app bar.
  final Widget? title;

  /// Location of the main title of the app bar.
  final bool useTitleInFlexibleSpace;

  /// Custom text style for the app bar title.
  final TextStyle? titleStyle;

  /// Determines if a back arrow is shown in the app bar.
  final bool showBackArrow;

  /// Custom leading icon for the app bar.
  final IconData? leadingIcon;

  /// Callback triggered when the leading icon is pressed.
  final VoidCallback? leadingOnPressed;

  /// Sets the expanded height of the app bar when scrolled down.
  final double expandedHeight;

  /// Custom widget to display as flexible space when the app bar is expanded.
  final Widget? flexibleSpace;

  /// Custom background widget or color for the expanded app bar.
  final Widget? background;

  /// Determines if the app bar should float when scrolled up.
  final bool floating;

  /// Determines if the app bar remains pinned at the top of the screen.
  final bool pinned;

  /// Determines if the app bar snaps into view when partially scrolled.
  final bool snap;

  /// Custom actions widgets for the app bar.
  final List<Widget>? actions;

  /// Background color of the AppBar.
  final Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    // Check if dark mode is enabled to adjust colors dynamically
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return SliverAppBar(
      backgroundColor: backgroundColor ?? (isDarkMode ? TColors.darkBackground : TColors.lightBackground),

      // Disable automatic leading widget to customize the leading behavior
      automaticallyImplyLeading: false,

      // Expanded height of the app bar
      expandedHeight: expandedHeight,

      // Scrolling behavior controls
      floating: floating,
      // Enables floating app bar behavior
      pinned: pinned,
      // Keeps app bar pinned at the top
      snap: snap,
      // Enables snap behavior for the floating app bar

      // Leading widget: either back arrow or custom icon
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Navigator.pop(context), // Generic navigation back
              icon: Icon(
                Iconsax.arrow_left,
                color: isDarkMode ? TColors.iconPrimaryDark : TColors.iconPrimaryLight,
              ),
            )
          : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,

      // Title for the app bar (visible when collapsed)
      title: (!useTitleInFlexibleSpace && title != null)
          ? DefaultTextStyle.merge(
              style: titleStyle ?? TextStyle(color: isDarkMode ? TColors.white : TColors.textPrimary),
              child: title!,
            )
          : null,

      // Action widgets (e.g., buttons or icons in the app bar)
      actions: actions,

      // Flexible space: provides content when the app bar is expanded
      flexibleSpace: flexibleSpace ??
          (useTitleInFlexibleSpace
              ? FlexibleSpaceBar(
                  title: title != null
                      ? DefaultTextStyle.merge(
                          style: titleStyle ?? TextStyle(color: isDarkMode ? TColors.white : TColors.textPrimary),
                          child: title!,
                        )
                      : null,
                  centerTitle: true,
                  background: background ?? Container(color: isDarkMode ? TColors.darkBackground : TColors.primaryBackground),
                )
              : null),
    );
  }
}
