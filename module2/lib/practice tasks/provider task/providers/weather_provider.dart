import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  final List<String> weatherList = [
    "Sunny",
    "Rainy",
    "Cloudy",
    "Stormy",
  ];

  int currentIndex = 0;

  String get weather => weatherList[currentIndex];

  void changeWeather() {
    currentIndex = (currentIndex + 1) % weatherList.length;
    notifyListeners();
  }
}