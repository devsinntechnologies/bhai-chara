import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneProvider {
  var phonenumber;
  Number(number) async {
    phonenumber = await number;
  }
}
