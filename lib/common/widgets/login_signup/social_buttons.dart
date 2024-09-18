import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key, this.onGooglePressed, this.onApplePressed});

  final void Function()? onGooglePressed, onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google Button
        Container(
          padding: const EdgeInsets.all(TSizes.xs),
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: onGooglePressed,
            icon: const Image(width: TSizes.iconMd + 4, height: TSizes.iconMd + 4, image: AssetImage(TImages.google)),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Facebook Button
        Container(
          padding: const EdgeInsets.all(TSizes.xs),
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: onApplePressed,
            icon: const Image(width: TSizes.iconMd + 4, height: TSizes.iconMd + 4, image: AssetImage(TImages.apple)),
          ),
        ),
      ],
    );
  }
}
