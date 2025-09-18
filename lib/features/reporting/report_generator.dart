import 'package:smart_ahwa_manager_app/core/models/order.dart';

/// DIP: An abstraction for report generation. High-level modules will depend on this,
/// not on concrete report generators.
abstract class ReportGenerator {
  String generate(List<Order> orders);
}


