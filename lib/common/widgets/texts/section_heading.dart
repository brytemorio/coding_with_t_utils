import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.rightWidget,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  final Color? textColor;
  final String title;
  final Widget? rightWidget;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineLarge!.apply(color: textColor),
        ),
        rightWidget ?? const SizedBox.shrink()
      ],
    );
  }
}
