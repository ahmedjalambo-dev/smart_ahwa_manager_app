import 'package:smart_ahwa_manager_app/core/models/drink.dart';
import 'package:smart_ahwa_manager_app/features/ahwa_manager/ahwa_manager.dart';
import 'package:smart_ahwa_manager_app/features/reporting/daily_summary_report.dart';
import 'package:smart_ahwa_manager_app/features/reporting/top_drinks_report.dart';

void main() {
  final ahwa = AhwaManager();

  // Add some orders
  ahwa.createNewOrder(
    customerName: 'Ahmed',
    drink: Shai(),
    instructions: 'extra mint, ya rais',
  );
  ahwa.createNewOrder(customerName: 'Fatima', drink: TurkishCoffee());
  ahwa.createNewOrder(customerName: 'Mona', drink: Shai());

  // Show the dashboard
  ahwa.displayPendingOrdersDashboard();

  // Complete an order
  ahwa.markOrderAsCompleted(1);
  ahwa.markOrderAsCompleted(2);

  // Show the dashboard again
  ahwa.displayPendingOrdersDashboard();

  // Generate different reports
  ahwa.generateAndPrintReport(TopDrinksReportGenerator());
  ahwa.generateAndPrintReport(DailySummaryReportGenerator());
}
