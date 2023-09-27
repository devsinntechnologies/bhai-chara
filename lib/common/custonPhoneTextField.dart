import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


// ignore: must_be_immutable
class CustomCountryPhoneField extends StatelessWidget {
  CustomCountryPhoneField({super.key, this.controller});
  var controller;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var size = MediaQuery.of(context).size;
    return Container(
      child: IntlPhoneField(
        controller: controller,
        flagsButtonPadding: const EdgeInsets.all(8),
        dropdownIconPosition: IconPosition.trailing,
        decoration: InputDecoration(
          counterText: " ",
          labelText: 'Phone Number',
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(20)),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}
