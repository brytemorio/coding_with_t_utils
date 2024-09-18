import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../utils/exports.dart';
import 'country_code_picker.dart';

class TPhoneWithCountryCodePicker extends StatelessWidget {
  const TPhoneWithCountryCodePicker({super.key, this.countryCodeOnChanged, this.phoneController});

  final void Function(CountryCode)? countryCodeOnChanged;
  final TextEditingController? phoneController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCountryCodePicker(onChanged: countryCodeOnChanged),
        const SizedBox(width: TSizes.spaceBtwItems / 2),
        Expanded(
          child: TextFormField(
            controller: phoneController,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: TTexts.phoneNo),
          ),
        ),
      ],
    );
  }
}
