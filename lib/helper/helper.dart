class Helper {
  static double getDiscountPrice(int price, double discount) {
    return price - (price * discount / 100);
  }
}
