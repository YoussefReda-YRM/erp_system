import 'package:erp_system/core/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomIntlPhoneField extends StatelessWidget {
  const CustomIntlPhoneField({
    super.key, required this.phoneController,
  });
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
      initialCountryCode: 'EG',

      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsApp.primaryColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsApp.primaryColor,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
