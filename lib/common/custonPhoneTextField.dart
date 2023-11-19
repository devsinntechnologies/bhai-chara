// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../provider/firebase/phone_number.dart';

// ignore: must_be_immutable
class CustomCountryPhoneField extends StatelessWidget {
  CustomCountryPhoneField(
      {super.key, this.controller, this.completePhoneNumber = ""});
  var controller, completePhoneNumber;

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
        onChanged: (phone) async {
          PhoneProvider.phonenumber = await phone.completeNumber;
        },
      ),
    );
  }
}
