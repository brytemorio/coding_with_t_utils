import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../texts/page_heading.dart';

/// A widget that combines breadcrumbs navigation with a page heading.
///
/// - [breadcrumbItems] defines the list of breadcrumb navigation items.
/// - [heading] sets the main title of the page.
/// - [subHeading] is an optional secondary heading for additional context.
/// - [returnToPreviousScreen] adds a back button to navigate to the previous screen.
/// - [iconData] allows displaying an optional icon next to the heading.
/// - [homeOnTap] is the callback for tapping the home/dashboard link.
/// - [homeTitle] customizes the home link widget (default: "Dashboard").
/// - [homeTitleStyle] and [breadcrumbItemsTextStyle] provide text style customizations.
/// - The last item in [breadcrumbItems] is treated as the current page and is not clickable.
class TBreadcrumbsWithHeading extends StatelessWidget {
  const TBreadcrumbsWithHeading({
    super.key,
    required this.breadcrumbItems,
    required this.heading,
    this.returnToPreviousScreen = false,
    this.iconData,
    this.subHeading,
    this.homeOnTap,
    this.homeTitle,
    this.homeTitleStyle,
    this.breadcrumbItemsTextStyle,
  });

  /// The heading/title for the page.
  final String heading;

  /// Optional sub-heading for additional context.
  final String? subHeading;

  /// Optional icon displayed next to the heading.
  final IconData? iconData;

  /// Custom widget for the home link (default: "Dashboard").
  final Widget? homeTitle;

  /// Text style for the home link.
  final TextStyle? homeTitleStyle;

  /// Text style for breadcrumb items.
  final TextStyle? breadcrumbItemsTextStyle;

  /// Callback when the home link is tapped.
  final void Function()? homeOnTap;

  /// List of breadcrumb items representing the navigation path.
  /// The last item is the current page and is not clickable.
  final List<String> breadcrumbItems;

  /// Determines whether to include a back button for returning to the previous screen.
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb navigation row
        Row(
          children: [
            // Home link (Dashboard)
            InkWell(
              onTap: homeOnTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: homeTitleStyle ??
                      theme.textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w500),
                  child: homeTitle ?? const Text('Dashboard'),
                ),
              ),
            ),
            // Breadcrumb trail
            for (int i = 0; i < breadcrumbItems.length; i++)
              Row(
                children: [
                  const Text(' / '), // Separator
                  InkWell(
                    // Make all breadcrumb items clickable except the last one
                    onTap: i == breadcrumbItems.length - 1
                        ? null
                        : () => Get.toNamed(breadcrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        capitalize(breadcrumbItems[i]),
                        style: breadcrumbItemsTextStyle ??
                            theme.textTheme.bodySmall!.copyWith(
                              fontWeight: i == breadcrumbItems.length - 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: i == breadcrumbItems.length - 1
                                  ? theme.colorScheme.onSurface
                                  : theme.colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: 16.0), // Spacing between breadcrumbs and heading
        // Page heading row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (returnToPreviousScreen)
              IconButton(
                icon: const Icon(Iconsax.arrow_left),
                onPressed: () => Navigator.pop(context),
              ),
            if (returnToPreviousScreen) const SizedBox(width: 8.0),
            Expanded(
              child: TPageHeading(
                  heading: heading, iconData: iconData, subHeading: subHeading),
            ),
          ],
        ),
      ],
    );
  }

  /// Capitalizes the first letter of the given string.
  String capitalize(String text) {
    if (text.isEmpty) return '';
    if (text[0] == '/') {
      text = text.substring(1);
    }
    return text[0].toUpperCase() + text.substring(1);
  }
}
