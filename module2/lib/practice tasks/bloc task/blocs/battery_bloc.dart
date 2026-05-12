import 'dart:async';

class BatteryBloc {
  final StreamController<int> _batteryController =
      StreamController<int>();

  int _batteryLevel = 50;

  Stream<int> get batteryStream => _batteryController.stream;

  void changeBattery() {
    _batteryLevel -= 10;

    if (_batteryLevel < 0) {
      _batteryLevel = 100;
    }

    _batteryController.sink.add(_batteryLevel);
  }

  void dispose() {
    _batteryController.close();
  }
}