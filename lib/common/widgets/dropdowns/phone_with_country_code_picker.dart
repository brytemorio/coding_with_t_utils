import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../utils/exports.dart';
import 'country_code_picker.dart';

class TPhoneWithCountryCodePicker extends StatelessWidget {
  const TPhoneWithCountryCodePicker({
    super.key,
    this.countryCodeOnChanged,
    this.phoneController,
    this.validator,
    this.applyValidation = true,
  });

  final void Function(CountryCode)? countryCodeOnChanged;
  final TextEditingController? phoneController;
  final String? Function(String?)? validator;
  final bool applyValidation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCountryCodePicker(onChanged: countryCodeOnChanged),
        SizedBox(width: TSizes().spaceBtwItems / 2),
        Expanded(
          child: TextFormField(
            controller: phoneController,
            validator: validator ??
                (applyValidation
                    ? (value) => TValidator.validatePhoneNumber(value)
                    : null),
            decoration: const InputDecoration(labelText: 'Phone Number'),
          ),
        ),
      ],
    );
  }
}
