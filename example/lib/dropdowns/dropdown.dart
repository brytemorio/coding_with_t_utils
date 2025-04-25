import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/dropdowns/searchable_dropdown.dart';
import 'package:t_utils/t_utils.dart';

class TDropdownExample extends StatelessWidget {
  const TDropdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TDropdown<String>(
          labelText: "Select Country: Menu",
          popupStyle: DropdownPopupStyle.menu,
          showSearchBox: true,
          items: (query, _) =>
              Future.value(['USA', 'Canada', 'India', 'Pakistan']),
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
        TDropdown<String>(
          labelText: "Search Country: BottomSheet",
          showSearchBox: true,
          popupStyle: DropdownPopupStyle.bottomSheet,
          items: (query, _) => Future.value(
              ['USA', 'Canada', 'India', 'Germany', 'Australia', 'Pakistan']),
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
        TDropdown<String>(
          labelText: "Select Color: Dialog",
          popupStyle: DropdownPopupStyle.dialog,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Select a Color",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          items: (query, _) => Future.value(['Red', 'Green', 'Blue', 'Yellow']),
          showSearchBox: true,
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
        TDropdown<String>(
          labelText: "Search City: Modal",
          showSearchBox: true,
          popupStyle: DropdownPopupStyle.modal,
          noResultsText: "City not found!",
          items: (query, _) =>
              Future.value(['New York', 'Los Angeles', 'Chicago', 'Houston']),
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
      ],
    );
  }
}
