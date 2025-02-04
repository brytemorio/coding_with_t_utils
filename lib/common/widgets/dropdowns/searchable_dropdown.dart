import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:t_utils/t_utils.dart';

/// A generic dropdown widget that supports various styles and configurations.
///
/// - Supports async data loading, search functionality, and different popup styles.
/// - Allows customization of decoration, validation, and item formatting.
class TDropdown<T> extends StatelessWidget {
  const TDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.labelText,
    this.hintText = 'Select an option',
    this.onChanged,
    this.showSearchBox = false,
    this.popupStyle = DropdownPopupStyle.menu,
    this.title,
    this.itemAsString,
    this.filterFn,
    this.validator,
    this.enabled = true,
    this.searchDelay,
    this.loadingIndicator = const CircularProgressIndicator(),
    this.noResultsText = "No results found",
    this.compareFn,
    this.icon,
    this.iconColor,
    this.errorText,
    this.helperText,
    this.suffixIcon,
    this.prefixIcon,
  });

  /// Function that provides items asynchronously or synchronously.
  final FutureOr<List<T>> Function(String query, LoadProps?)? items;

  /// The currently selected item.
  final T? selectedItem;

  /// Label text for the dropdown.
  final String? labelText;

  /// Hint text displayed inside the dropdown.
  final String hintText;

  /// Callback triggered when the selection changes.
  final void Function(T?)? onChanged;

  /// Whether to display a search box inside the dropdown popup.
  final bool showSearchBox;

  /// Delay duration for search input processing.
  final Duration? searchDelay;

  /// Style of the dropdown popup (e.g., menu, modal, dialog, bottom sheet).
  final DropdownPopupStyle popupStyle;

  /// Optional title displayed in some popup styles.
  final Widget? title;

  /// Function to convert items to string representation.
  final String Function(T)? itemAsString;

  /// Function to filter search results.
  final bool Function(T, String)? filterFn;

  /// Validator function for form validation.
  final String? Function(T?)? validator;

  /// Whether the dropdown is enabled.
  final bool enabled;

  /// Widget shown when loading data.
  final Widget loadingIndicator;

  /// Text displayed when no results are found.
  final String noResultsText;

  /// Function to compare two items.
  final bool Function(T, T)? compareFn;

  /// Icon for the dropdown.
  final Widget? icon;

  /// Color of the dropdown icon.
  final Color? iconColor;

  /// Error text displayed when validation fails.
  final String? errorText;

  /// Helper text displayed below the dropdown.
  final String? helperText;

  /// Suffix icon displayed inside the dropdown field.
  final Widget? suffixIcon;

  /// Prefix icon displayed inside the dropdown field.
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      items: items,
      enabled: enabled,
      validator: validator,
      itemAsString: itemAsString,
      filterFn: filterFn,
      compareFn: compareFn ?? (item1, item2) => item1 == item2,
      onChanged: onChanged,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          filled: true,
          icon: icon,
          iconColor: iconColor,
          errorText: errorText,
          helperText: helperText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
      popupProps: _getPopupProps(context),
    );
  }

  PopupProps<T> _getPopupProps(BuildContext context) {
    switch (popupStyle) {
      case DropdownPopupStyle.modal:
        return modalStyle(context);
      case DropdownPopupStyle.bottomSheet:
        return bottomSheetStyle(context);
      case DropdownPopupStyle.menu:
        return menuStyle(context);
      case DropdownPopupStyle.dialog:
        return dialogStyle(context);
    }
  }

  PopupProps<T> bottomSheetStyle(BuildContext context) {
    return PopupProps.bottomSheet(
      title: title,
      showSearchBox: showSearchBox,
      bottomSheetProps: BottomSheetProps(
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors().darkBackground : Colors.white,
      ),
      searchDelay: searchDelay ?? Duration.zero,
      searchFieldProps: _searchFieldProps(),
      emptyBuilder: (context, searchEntry) => Center(child: Text(noResultsText)),
      loadingBuilder: (context, msg) => Center(child: loadingIndicator),
    );
  }

  PopupProps<T> menuStyle(BuildContext context) {
    return PopupProps.menu(
      showSearchBox: showSearchBox,
      searchDelay: searchDelay ?? Duration.zero,
      menuProps: MenuProps(
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors().darkBackground : Colors.white,
      ),
      searchFieldProps: _searchFieldProps(),
      emptyBuilder: (context, searchEntry) => Center(child: Text(noResultsText)),
      loadingBuilder: (context, msg) => Center(child: loadingIndicator),
    );
  }

  PopupProps<T> dialogStyle(BuildContext context) {
    return PopupProps.dialog(
      title: title,
      showSearchBox: showSearchBox,
      searchDelay: searchDelay ?? Duration.zero,
      dialogProps: DialogProps(
        contentPadding: EdgeInsets.all(TSizes().md),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors().darkBackground : Colors.white,
      ),
      searchFieldProps: _searchFieldProps(),
      emptyBuilder: (context, searchEntry) => Center(child: Text(noResultsText)),
      loadingBuilder: (context, msg) => Center(child: loadingIndicator),
    );
  }

  PopupProps<T> modalStyle(BuildContext context) {
    return PopupProps.modalBottomSheet(
      title: title,
      showSearchBox: showSearchBox,
      searchDelay: searchDelay ?? Duration.zero,
      modalBottomSheetProps: ModalBottomSheetProps(
        padding: EdgeInsets.all(TSizes().md),
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors().darkBackground : Colors.white,
      ),
      searchFieldProps: _searchFieldProps(),
      emptyBuilder: (context, searchEntry) => Center(child: Text(noResultsText)),
      loadingBuilder: (context, msg) => Center(child: loadingIndicator),
    );
  }

  TextFieldProps _searchFieldProps() {
    return showSearchBox
        ? TextFieldProps(
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Type to search...",
              border: const OutlineInputBorder(),
            ),
          )
        : TextFieldProps();
  }
}
