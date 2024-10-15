import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  var todos = <String>['Ashraful', 'Alam', 'ME'];
  // ignore: prefer_typing_uninitialized_variables
  var value;

  TextProvider({this.value = 'hello old friend'});

  void add(valueinput) {
    // todos.add(value);
    value = valueinput;
    notifyListeners();
  }

  void remove(value) {
    todos.remove(value);
    notifyListeners();
  }
}
