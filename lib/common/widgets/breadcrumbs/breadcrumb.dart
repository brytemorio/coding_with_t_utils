import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBreadcrumbs extends StatelessWidget {
  // Constructor for TBreadcrumbs widget
  const TBreadcrumbs({
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

    return Row(
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
    );
  }

  // Function to capitalize the first letter of a string
  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
