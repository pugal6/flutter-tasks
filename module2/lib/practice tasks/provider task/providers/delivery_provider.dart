import 'package:flutter/material.dart';

class DeliveryProvider extends ChangeNotifier {
  final List<String> statusList = [
    "Preparing",
    "On the Way",
    "Delivered",
  ];

  int currentIndex = 0;

  String get status => statusList[currentIndex];

  void changeStatus() {
    currentIndex = (currentIndex + 1) % statusList.length;
    notifyListeners();
  }
}