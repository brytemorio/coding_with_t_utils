import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/chips/choice_chip.dart';

class TChipsExample extends StatelessWidget {
  const TChipsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        TChoiceChip(
          text: "Option A",
          selected: true,
          onSelected: (isSelected) {
            // Handle selection
          },
        ),
        TChoiceChip(
          text: "0xFFFF5733", // Color value
          selected: true,
          isColorAttribute: true,
          onSelected: (isSelected) {
            // Handle color selection
          },
        ),
        TChoiceChip(
          text: "0xFFAB3559", // Color value
          selected: false,
          isColorAttribute: true,
          selectedTextColor: Colors.white,
          onSelected: (isSelected) {
            // Handle color selection
          },
        ),
        TChoiceChip(
          text: "Custom Chip with Icon",
          selected: true,
          selectedTextColor: Colors.blue,
          unselectedTextColor: Colors.grey,
          backgroundColor: Colors.amberAccent,
          customCheckmarkIcon:
              Icon(Icons.health_and_safety_rounded, color: Colors.blue),
          borderShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (isSelected) {
            // Handle selection
          },
        ),
        TChoiceChip(
          text: "Custom Chip without Icon",
          selected: true,
          showCheckmark: false,
          selectedTextColor: Colors.blue,
          unselectedTextColor: Colors.grey,
          backgroundColor: Colors.amberAccent,
          borderShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (isSelected) {
            // Handle selection
          },
        ),
      ],
    );
  }
}
