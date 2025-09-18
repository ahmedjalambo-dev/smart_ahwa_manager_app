import 'package:smart_ahwa_manager_app/core/models/order.dart';

/// DIP: An abstraction for report generation. High-level modules will depend on this,
/// not on concrete report generators.
abstract class ReportGenerator {
  String generate(List<Order> orders);
}

/// OCP: A concrete implementation of a report. We can create more report types
/// by implementing the ReportGenerator interface without changing any existing code.
class TopDrinksReportGenerator implements ReportGenerator {
  @override
  String generate(List<Order> orders) {
    if (orders.isEmpty) return 'No orders to generate a report from.';

    final drinkCounts = <String, int>{};
    for (var order in orders) {
      drinkCounts.update(
        order.drink.name,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
    }

    final sortedDrinks = drinkCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    var report = '--- Top Selling Drinks Report ---\n';
    for (var entry in sortedDrinks) {
      report += '${entry.key}: ${entry.value} sold\n';
    }
    return report;
  }
}
