import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TDropdown<T> extends StatelessWidget {
  const TDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.labelText,
    this.hintText = 'Select an option',
    this.onChanged,
    this.showSearchBox = false,
    this.isBottomSheet = false,
    this.title,
    this.itemAsString,
    this.filterFn,
    this.validator,
    this.enabled = true,
    this.loadingIndicator = const CircularProgressIndicator(),
    this.noResultsText = "No results found",
    this.compareFn,
  });

  final FutureOr<List<T>> Function(String query, LoadProps?)? items;
  final T? selectedItem;
  final String? labelText;
  final String hintText;
  final void Function(T?)? onChanged;
  final bool showSearchBox;
  final bool isBottomSheet;
  final Widget? title;
  final String Function(T)? itemAsString;
  final bool Function(T, String)? filterFn;
  final String? Function(T?)? validator;
  final bool enabled;
  final Widget loadingIndicator;
  final String noResultsText;
  final bool Function(T, T)? compareFn;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      items: items,
      enabled: enabled,
      validator: validator,
      itemAsString: itemAsString,
      filterFn: filterFn,
      compareFn: compareFn,
      onChanged: onChanged,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
      popupProps: isBottomSheet
          ? PopupProps.bottomSheet(
              showSearchBox: showSearchBox,
              title: title,
              searchFieldProps: showSearchBox
                  ? TextFieldProps(
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Type to search...",
                        border: const OutlineInputBorder(),
                      ),
                    )
                  : TextFieldProps(),
              emptyBuilder: (context, searchEntry) =>
                  Center(child: Text(noResultsText)),
              loadingBuilder: (context, msg) => Center(child: loadingIndicator),
            )
          : PopupProps.menu(
              showSearchBox: showSearchBox,
              searchFieldProps: showSearchBox
                  ? TextFieldProps(
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Type to search...",
                      ),
                    )
                  : TextFieldProps(),
              emptyBuilder: (context, searchEntry) =>
                  Center(child: Text(noResultsText)),
              loadingBuilder: (context, msg) => Center(child: loadingIndicator),
            ),
    );
  }
}
