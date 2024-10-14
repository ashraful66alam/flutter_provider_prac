import 'package:flutter/material.dart';

class TodolistProvider extends ChangeNotifier {
  var todos = <String>['Ashraful', 'Alam', 'ME'];
  // ignore: prefer_typing_uninitialized_variables
  var value;

  TodolistProvider({this.value = 'hello'});

  void add(value) {
    todos.add(value);
    notifyListeners();
  }

  void remove(value) {
    todos.remove(value);
    notifyListeners();
  }
}
