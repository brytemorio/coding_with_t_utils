import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

/// A reusable divider with a customizable text in the middle.
class TDivider extends StatelessWidget {
  const TDivider({
    super.key,
    required this.dividerText,
    this.dividerColor,
    this.textStyle,
    this.indent = 60.0,
    this.endIndent = 60.0,
  });

  /// The text to display in the middle of the divider.
  final String dividerText;

  /// Custom color for the divider. If not provided, defaults to light or dark mode colors.
  final Color? dividerColor;

  /// Custom style for the divider text. If not provided, defaults to the theme's labelMedium style.
  final TextStyle? textStyle;

  /// Indentation from the left edge for the divider.
  final double indent;

  /// Indentation from the right edge for the divider.
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    // Get the appropriate divider color depending on the theme (dark or light mode).
    final dividerColor = this.dividerColor ??
        (THelperFunctions.isDarkMode(context)
            ? TColors().darkGrey
            : TColors().grey);

    // Use a default text style or allow the user to provide their own.
    final textStyle = this.textStyle ?? Theme.of(context).textTheme.labelMedium;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dividerColor,
                thickness: 0.5,
                indent: indent,
                endIndent: 5)),
        Text(dividerText, style: textStyle),
        Flexible(
            child: Divider(
                color: dividerColor,
                thickness: 0.5,
                indent: 5,
                endIndent: endIndent)),
      ],
    );
  }
}
