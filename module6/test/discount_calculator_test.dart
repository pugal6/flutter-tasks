import 'package:flutter_test/flutter_test.dart';

double calculateDiscountedPrice(
  double originalPrice,
  double discountPercentage,
) {
  return originalPrice - (originalPrice * discountPercentage / 100);
}

void main() {
  group('Discount Calculator Tests', () {
    test('returns correct discounted value', () {
      expect(calculateDiscountedPrice(100, 20), 80);
    });

    test('returns original price when discount is 0%', () {
      expect(calculateDiscountedPrice(250, 0), 250);
    });

    test('returns 0 when discount is 100%', () {
      expect(calculateDiscountedPrice(500, 100), 0);
    });

    test('works with decimal prices', () {
      expect(calculateDiscountedPrice(99.99, 10), 89.991);
    });

    test('works with small values', () {
      expect(calculateDiscountedPrice(10, 5), 9.5);
    });
  });
}