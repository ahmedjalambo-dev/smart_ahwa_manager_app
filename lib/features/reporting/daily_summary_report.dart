import 'package:smart_ahwa_manager_app/core/models/order.dart';
import 'package:smart_ahwa_manager_app/features/reporting/report_generator.dart';

/// OCP: Another concrete implementation, demonstrating extensibility.
class DailySummaryReportGenerator implements ReportGenerator {
  @override
  String generate(List<Order> orders) {
    final completedOrders = orders.where(
      (o) => o.status == OrderStatus.completed,
    );
    final totalSales = completedOrders.fold<double>(
      0,
      (sum, order) => sum + order.drink.price,
    );

    var report = '--- Daily Summary Report ---\n';
    report += 'Total Orders Served: ${completedOrders.length}\n';
    report += 'Total Sales: \$ ${totalSales.toStringAsFixed(2)}\n';
    return report;
  }
}
