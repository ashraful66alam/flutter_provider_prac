import 'package:flutter/material.dart';

class TodolistProvider extends ChangeNotifier {
  var todos = <String>['A', 'B', 'C'];
  var one='one';
  void add(value) {
    // counter++;
    todos.add(value);
    notifyListeners();
  }

  void remove(value) {
    todos.remove(value);
    notifyListeners();
  }
}
