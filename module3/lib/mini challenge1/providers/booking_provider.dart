import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {
  final List<String> _bookedEvents = [];

  List<String> get bookedEvents => _bookedEvents;

  bool isBooked(String eventTitle) {
    return _bookedEvents.contains(eventTitle);
  }

  void bookEvent(String eventTitle) {
    if (!_bookedEvents.contains(eventTitle)) {
      _bookedEvents.add(eventTitle);
      notifyListeners();
    }
  }
}