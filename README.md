
# ☕ Smart Ahwa Manager App

A simple yet robust command-line application for managing orders in a traditional coffee shop ('Ahwa'). This project is built with Dart and serves as a practical demonstration of of **SOLID** and **Object-Oriented** principles for creating scalable and maintainable software.

-----

## 🎯 Core Features 

  - **Order Management**: Create and track customer orders for various drinks.
  - **Status Tracking**: Each order has a status (`pending` or `completed`) to manage workflow.
  - **Pending Orders Dashboard** 🖥️: View a real-time dashboard of all currently pending orders.
  - **Extensible Reporting**: Generate insightful reports from order data. The system is designed to easily accommodate new report types.
      - **Daily Summary Report**: Calculates total orders served and total sales revenue.
      - **Top Selling Drinks Report**: Ranks drinks by their sales volume.

-----

## ✅ Emphasis on SOLID Design Principles 

This project was built with a strong focus on the SOLID principles of object-oriented design.

#### 1\. Single Responsibility Principle (SRP)

The `OrderManager` class (`lib/core/services/order_manager.dart`) is responsible *only* for managing the lifecycle of orders (adding, completing, querying). It does not handle report generation or user interaction, ensuring a clear separation of concerns.

#### 2\. Open/Closed Principle (OCP)

The reporting feature is designed to be open for extension but closed for modification. By depending on the `ReportGenerator` abstraction, new report types can be added simply by creating a new class that implements the interface. No changes are needed in the `AhwaManager` class.

```dart
// lib/features/reporting/report_generator.dart
abstract class ReportGenerator {
  String generate(List<Order> orders);
}

// New reports can be added easily
class NewFinancialReport implements ReportGenerator {
  @override
  String generate(List<Order> orders) {
    // ... new report logic
    return '...';
  }
}
```

#### 3\. Dependency Inversion Principle (DIP)

High-level modules do not depend on low-level modules; both depend on abstractions. The `AhwaManager` class depends on the `ReportGenerator` abstraction, not on concrete implementations like `DailySummaryReportGenerator`. This decouples the core logic from the specific reporting details.

```dart
// lib/features/ahwa_manager/ahwa_manager.dart
class AhwaManager {
  final OrderManager _orderManager = OrderManager();

  // Depends on the abstraction, not the concrete class
  void generateAndPrintReport(ReportGenerator generator) {
    print('\nGenerating Report...');
    final report = generator.generate(_orderManager.allOrders);
    print(report);
  }
}
```

-----

## 📁 Project Structure 

The codebase is organized into two main layers to promote separation of concerns:

  - `lib/core/`: Contains the fundamental building blocks of the application.
      - `models/`: Data structures like `Order` and `Drink`.
      - `services/`: Core logic services like `OrderManager`.
  - `lib/features/`: Contains the higher-level, application-specific features.
      - `ahwa_manager/`: The main facade for interacting with the system.
      - `reporting/`: Modules for generating different types of reports.
  - `lib/smart_ahwa_manager_app.dart`: The main entry point of the application.

-----

## 🚀 How to Run 

1.  **Ensure you have the Dart SDK installed.**

2.  **Get dependencies:**

    ```bash
    dart pub get
    ```

3.  **Run the application:**

    ```bash
    dart run lib/smart_ahwa_manager_app.dart
    ```

-----

## 💻 Example Output 

Running the application will produce the following output, demonstrating the entire workflow from order creation to report generation.

```
Added: Order #1: Shai for Ahmed (OrderStatus.pending) - Instructions: "extra mint, ya rais"
Added: Order #2: Turkish Coffee for Fatima (OrderStatus.pending) - Instructions: "None"
Added: Order #3: Shai for Mona (OrderStatus.pending) - Instructions: "None"

--- PENDING ORDERS DASHBOARD ---
Order #1: Shai for Ahmed (OrderStatus.pending) - Instructions: "extra mint, ya rais"
Order #2: Turkish Coffee for Fatima (OrderStatus.pending) - Instructions: "None"
Order #3: Shai for Mona (OrderStatus.pending) - Instructions: "None"
--------------------------------------

Completed: Order #1: Shai for Ahmed (OrderStatus.completed) - Instructions: "extra mint, ya rais"
Completed: Order #2: Turkish Coffee for Fatima (OrderStatus.completed) - Instructions: "None"

--- PENDING ORDERS DASHBOARD ---
Order #3: Shai for Mona (OrderStatus.pending) - Instructions: "None"
--------------------------------------


Generating Report...
--- Top Selling Drinks Report ---
Shai: 2 sold
Turkish Coffee: 1 sold

Generating Report...
--- Daily Summary Report ---
Total Orders Served: 2
Total Sales: $ 15.00
```