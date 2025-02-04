import 'package:flutter/material.dart';

import '../../../utils/exports.dart';

/// A professional and reusable table header widget with search, filters, actions, and sorting.
class TTableHeader extends StatelessWidget {
  const TTableHeader({
    super.key,
    this.buttonText = 'Create',
    this.onCreatePressed,
    this.searchController,
    this.onSearchChanged,
    this.onSearchSubmitted,
    this.showCreateButton = true,
    this.width,
    this.actions = const [],
    this.filters = const [],
    this.onSort,
    this.sortLabel,
    this.showSortButton = false,
  });

  /// Text for the "Create" button.
  final String buttonText;

  /// Callback for the "Create" button.
  final VoidCallback? onCreatePressed;

  /// Controller for the search input field.
  final TextEditingController? searchController;

  /// Callback when the search input changes.
  final ValueChanged<String>? onSearchChanged;

  /// Callback when the search input is submitted.
  final ValueChanged<String>? onSearchSubmitted;

  /// Whether to show the "Create" button.
  final bool showCreateButton;

  /// Optional custom width for the "Create" button.
  final double? width;

  /// Additional action widgets (e.g., Export, Print).
  final List<Widget> actions;

  /// Widgets for filters (e.g., dropdowns, chips).
  final List<Widget> filters;

  /// Callback for sorting functionality.
  final VoidCallback? onSort;

  /// Label for the sorting column.
  final String? sortLabel;

  /// Whether to show the sorting button.
  final bool showSortButton;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = TDeviceUtils.isMobileScreen(context);

        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: TSizes().spaceBtwItems,
              horizontal: TSizes().spaceBtwItems / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Actions and Filters
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Create Button
                  if (showCreateButton)
                    SizedBox(
                      width: width ?? 200,
                      child: ElevatedButton(
                        onPressed: onCreatePressed,
                        child: Text(buttonText),
                      ),
                    ),

                  // Filters and Actions
                  Row(
                    children: [
                      // Filters
                      ...filters,

                      // Sort Button
                      if (showSortButton)
                        TextButton.icon(
                          onPressed: onSort,
                          icon: const Icon(Icons.sort),
                          label: Text(sortLabel ?? 'Sort'),
                        ),

                      // Additional Actions
                      ...actions,
                    ],
                  ),
                ],
              ),

              if (!isMobile) SizedBox(height: TSizes().spaceBtwItems),

              // Search Bar
              TextFormField(
                controller: searchController,
                onChanged: onSearchChanged,
                onFieldSubmitted: onSearchSubmitted,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController?.text.isNotEmpty == true
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController?.clear();
                            if (onSearchChanged != null) onSearchChanged!('');
                          },
                        )
                      : null,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(TSizes().borderRadiusLg)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
