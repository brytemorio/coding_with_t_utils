import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/exports.dart';
import '../icons/t_icon.dart';

class TTextWithIcon extends StatelessWidget {
  const TTextWithIcon({
    super.key,
    this.icon = Iconsax.add,
    required this.text,
    this.color,
    this.backgroundColor,
    this.textStyle,
  });

  final IconData icon;
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TIcon(
          icon: icon,
          color: color ?? TColors.primary,
          backgroundColor: backgroundColor ?? TColors.lightBackground,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: DefaultTextStyle(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle ?? (Theme.of(context).textTheme.headlineMedium!),
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
