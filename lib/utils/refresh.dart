import 'dart:convert';
import 'package:bhai_chara/view/home-screens/root_screen.dart';
import 'package:http/http.dart' as http;

class User {
  final String name, image;

  User(this.name, this.image);

  RootScreen() {
    // TODO: implement RootScreen
    throw UnimplementedError();
  }
}

getUser() async {
  return RootScreen();
}
