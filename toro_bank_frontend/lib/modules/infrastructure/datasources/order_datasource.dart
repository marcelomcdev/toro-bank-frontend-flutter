abstract class OrderDataSource {
  Future<int> submitOrder(int userId, String symbol, int amount);
}
