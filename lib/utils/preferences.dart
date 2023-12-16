import 'package:shared_preferences/shared_preferences.dart';

const PREF_ADDRESS = "address";

class Preferences {
  static getAddress() async {
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString(PREF_ADDRESS);
    return data;
  }

  static saveAddress(address) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(PREF_ADDRESS, address);
  }
}
