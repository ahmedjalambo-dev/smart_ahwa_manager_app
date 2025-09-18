import 'package:smart_ahwa_manager_app/core/models/order.dart';

/// SRP: This class's ONLY responsibility is to manage the lifecycle of orders.
/// It doesn't know how to generate reports or save to a database.
class OrderManager {
  final List<Order> _orders = [];

  List<Order> get allOrders => List.unmodifiable(_orders);
  List<Order> get pendingOrders =>
      List.unmodifiable(_orders.where((o) => o.status == OrderStatus.pending));

  void addOrder(Order order) {
    _orders.add(order);
    print('Added: ${order.toString()}');
  }

  void completeOrder(int orderId) {
    try {
      final order = _orders.firstWhere((o) => o.id == orderId);
      order.complete();
      print('Completed: ${order.toString()}');
    } catch (e) {
      print('Error: Order with ID $orderId not found.');
    }
  }
}
