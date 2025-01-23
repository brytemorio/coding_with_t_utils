import 'package:flutter/material.dart';

import '../../../utils/exports.dart';
import '../icons/t_circular_icon.dart';

class TPageHeading extends StatelessWidget {
  const TPageHeading({
    super.key,
    required this.heading,
    this.subHeading,
    this.rightSideWidget,
    this.iconData,
  });

  final IconData? iconData;
  final String heading;
  final String? subHeading;
  final Widget? rightSideWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconData != null) TCircularIcon(icon: iconData!, backgroundColor: TColors.primary, color: TColors.white),
        if (iconData != null) SizedBox(width: TSizes.spaceBtwItems),

        // Show Heading Only
        if (subHeading == null) Text(heading, style: Theme.of(context).textTheme.headlineLarge),

        // Show Heading and Sub Heading
        if (subHeading != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading, style: Theme.of(context).textTheme.headlineLarge),
              Text(subHeading!, style: Theme.of(context).textTheme.bodyMedium, maxLines: 2),
            ],
          ),
        rightSideWidget ?? const SizedBox(),
      ],
    );
  }
}
