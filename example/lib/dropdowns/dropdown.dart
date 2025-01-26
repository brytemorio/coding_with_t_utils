import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/dropdowns/searchable_dropdown.dart';

class TDropdownExample extends StatelessWidget {
  const TDropdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TDropdown<String>(
          labelText: "Select Country",
          items: (query, _) =>
              Future.value(['USA', 'Canada', 'India', 'Pakistan']),
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
        TDropdown<String>(
          labelText: "Search Country",
          showSearchBox: true,
          items: (query, _) => Future.value(
              ['USA', 'Canada', 'India', 'Germany', 'Australia', 'Pakistan']),
          onChanged: (value) {
            print("Selected: $value");
          },
        ),
        TDropdown<String>(
          labelText: "Select Color",
          isBottomSheet: true,
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
          labelText: "Search City",
          showSearchBox: true,
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
