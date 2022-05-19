abstract class OrderDataSource {
  Future<String> submitOrder(int userId, String symbol, int amount);
}
