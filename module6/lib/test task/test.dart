double calculateDiscountedPrice(
  double originalPrice,
  double discountPercentage,
) {
  return originalPrice - (originalPrice * discountPercentage / 100);
}