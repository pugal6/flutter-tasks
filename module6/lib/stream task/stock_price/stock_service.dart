import 'dart:async';
import 'dart:math';

class StockService {
  final Random _random = Random();

  double _currentPrice = 150.0;

  Stream<double> getStockPriceStream() {
    return Stream.periodic(
      const Duration(seconds: 1),
      (_) {
        final change = _random.nextDouble() * 8 - 4;

        _currentPrice += change;

        return _currentPrice;
      },
    );
  }
}