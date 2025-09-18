import 'package:smart_ahwa_manager_app/core/models/drink.dart';

/// Enum for Order Status to ensure type safety.
enum OrderStatus { pending, completed }

/// Encapsulation: The Order's internal state (_status) is private and
/// can only be changed through a controlled public method (complete).
class Order {
  static int _counter = 0;
  final int id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  OrderStatus _status;

  Order({
    required this.customerName,
    required this.drink,
    this.specialInstructions = 'None',
  }) : id = ++_counter,
       _status = OrderStatus.pending;

  // Public getter to safely access the status.
  OrderStatus get status => _status;

  // Public method to control state changes.
  void complete() {
    _status = OrderStatus.completed;
  }

  @override
  String toString() {
    return 'Order #$id: ${drink.name} for $customerName ($status) - Instructions: "$specialInstructions"';
  }
}
