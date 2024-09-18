import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCountryCodePicker extends StatelessWidget {
  const TCountryCodePicker({super.key, this.onChanged});

  final void Function(CountryCode)? onChanged;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: dark ? TColors.darkContainer : TColors.accent,
        borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      ),
      child: CountryCodePicker(
        onChanged: onChanged,
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: 'ZA',
        dialogBackgroundColor: dark ? TColors.dark : TColors.white,
        searchDecoration: const InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search country'),

        favorite: const ['+27', 'ZA'],
        // optional. Shows only country name and flag
        showCountryOnly: false,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: false,
        // optional. aligns the flag and the Text left
        alignLeft: false,
        // Limit to specific countries
        countryFilter: const ['ZA', 'LS', 'BW', 'SZ', 'ZW', 'PK'],
      ),
    );
  }
}
