import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  var isOn = true;
  var counter = ValueNotifier(0);

  void incrementCounter() {
    counter.value++;
  }

  void seIson() {
    isOn = !isOn;
  }
}
