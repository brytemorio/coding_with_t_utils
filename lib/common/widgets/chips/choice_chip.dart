import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../containers/t_container.dart';

/// A customized choice chip that can act like a radio button.
class TChoiceChip extends StatelessWidget {
  /// Create a chip that acts like a radio button.
  ///
  /// Parameters:
  ///   - text: The label text for the chip.
  ///   - selected: Whether the chip is currently selected.
  ///   - onSelected: Callback function when the chip is selected.
  ///   - backgroundColor: Optional background color for the chip.
  ///   - selectedTextColor: Text color when the chip is selected.
  ///   - unselectedTextColor: Text color when the chip is not selected.
  ///   - borderShape: Optional shape for the chip border.
  ///   - isColorAttribute: If true, the chip represents a color value.
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
    this.backgroundColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderShape,
    this.customCheckmarkIcon,
    this.showCheckmark = true,
    this.isColorAttribute = false,
  });

  final String text;
  final bool selected;
  final bool showCheckmark;
  final bool isColorAttribute;
  final void Function(bool)? onSelected;
  final Color? backgroundColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Widget? customCheckmarkIcon;
  final OutlinedBorder? borderShape;

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = TextStyle(
      color: selected ? selectedTextColor ?? TColors().white : unselectedTextColor,
    );

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        avatar: isColorAttribute
            ? showCheckmark
                ? TContainer(
                    width: 24,
                    height: 24,
                    circular: true,
                    padding: EdgeInsets.all(0),
                    backgroundColor: backgroundColor ?? THelperFunctions.restoreColorFromValue(text),
                    child: (selected ? customCheckmarkIcon ?? Icon(Icons.check, color: Colors.white) : SizedBox.shrink()),
                  )
                : TContainer(
                    width: 24,
                    height: 24,
                    circular: true,
                    backgroundColor: backgroundColor ?? THelperFunctions.restoreColorFromValue(text),
                  )
            : selected
                ? showCheckmark
                    ? customCheckmarkIcon ?? Icon(Icons.check_circle, color: Colors.white)
                    : null
                : null,
        showCheckmark: false,
        chipAnimationStyle: ChipAnimationStyle(enableAnimation: AnimationStyle(curve: ElasticInCurve())),
        selected: selected,
        onSelected: onSelected,
        labelStyle: labelTextStyle,
        label: isColorAttribute ? const SizedBox() : Text(text),
        padding: isColorAttribute ? const EdgeInsets.all(0) : null,
        labelPadding: isColorAttribute ? const EdgeInsets.all(0) : null,
        shape: borderShape ?? (isColorAttribute ? const CircleBorder() : null),
        selectedColor:
            (isColorAttribute ? THelperFunctions.restoreColorFromValue(text).withValues(alpha: 0.2) : backgroundColor ?? TColors().primary),
      ),
    );
  }
}
