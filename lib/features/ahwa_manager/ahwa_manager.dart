import 'package:smart_ahwa_manager_app/core/models/drink.dart';
import 'package:smart_ahwa_manager_app/core/models/order.dart';
import 'package:smart_ahwa_manager_app/core/services/order_manager.dart';
import 'package:smart_ahwa_manager_app/features/reporting/report_generator.dart';

/// The main class that the UI would interact with.
class AhwaManager {
  final OrderManager _orderManager = OrderManager();

  void createNewOrder({
    required String customerName,
    required Drink drink,
    String instructions = 'None',
  }) {
    final order = Order(
      customerName: customerName,
      drink: drink,
      specialInstructions: instructions,
    );
    _orderManager.addOrder(order);
  }

  void markOrderAsCompleted(int orderId) {
    _orderManager.completeOrder(orderId);
  }

  void displayPendingOrdersDashboard() {
    print('\n--- PENDING ORDERS DASHBOARD ---');
    final pending = _orderManager.pendingOrders;
    if (pending.isEmpty) {
      print('All clear! No pending orders.');
    } else {
      pending.forEach(print);
    }
    print('--------------------------------------\n');
  }

  /// DIP: This method depends on the `ReportGenerator` abstraction,
  /// not a concrete implementation.
  void generateAndPrintReport(ReportGenerator generator) {
    print('\nGenerating Report...');
    final report = generator.generate(_orderManager.allOrders);
    print(report);
  }
}
