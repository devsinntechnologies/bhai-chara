import 'package:flutter/material.dart';

class VariableProvider extends ChangeNotifier {
  static IncrementVariable(var variable) {
    variable = variable + 1;
    return variable;
  }

  }
