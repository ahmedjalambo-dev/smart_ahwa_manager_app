
# Smart 'Ahwa' Manager

A command-line application built with Dart to simulate an order management system for a traditional coffee shop ('Ahwa'). This project serves as a practical demonstration of SOLID design principles to create software that is maintainable, scalable, and robust.

## 🌟 Features

  - Create and manage customer drink orders.
  - Track order status (`Pending`, `Completed`).
  - Display a live dashboard of all pending orders.
  - Generate extensible reports, such as:
      - A **Daily Summary** showing total sales and orders served.
      - A **Top-Selling Drinks** report.

## 🏗️ Design & Architecture

This project is intentionally designed to showcase the **SOLID** principles of object-oriented design.

### Key Principles Applied

#### SOLID

  * **S - Single Responsibility Principle (SRP)**

      * The `OrderManager` class (`lib/core/services/order_manager.dart`) has only one responsibility: to manage the lifecycle of orders (adding, completing, and retrieving them). It is not concerned with report generation or user interaction.

  * **O - Open/Closed Principle (OCP)**

      * The reporting feature is open for extension but closed for modification. You can create new types of reports (e.g., `HourlySalesReportGenerator`) by simply implementing the `ReportGenerator` interface (`lib/features/reporting/report_generator.dart`) without altering any existing reporting code.

  * **L - Liskov Substitution Principle (LSP)**

      * Subtypes of `Drink` (`Shai`, `TurkishCoffee`, `HibiscusTea`) can be used interchangeably wherever the base `Drink` class is expected, such as when creating an `Order`.

  * **I - Interface Segregation Principle (ISP)**

      * The `ReportGenerator` interface is lean and specific. Clients that need to generate reports only need to know about the `generate` method, nothing more.

  * **D - Dependency Inversion Principle (DIP)**

      * The high-level `AhwaManager` class depends on the `ReportGenerator` abstraction, not on concrete implementations like `DailySummaryReportGenerator` or `TopDrinksReportGenerator`. This allows us to inject any report generator at runtime, decoupling the modules.

### Other OOP Concepts

  * **Abstraction**: The `Drink` and `ReportGenerator` classes are `abstract`, defining a contract for concrete implementations to follow.
  * **Encapsulation**: The `Order` class's `_status` is private and can only be modified through the public `complete()` method, protecting its internal state.

## 📂 Project Structure

The project follows a clean, feature-oriented architecture.

```
lib
├── core
│   ├── models
│   │   ├── drink.dart      # Abstract Drink class and concrete implementations.
│   │   └── order.dart      # The Order model, encapsulating order data and status.
│   └── services
│       └── order_manager.dart # (SRP) Manages the lifecycle of orders.
├── features
│   ├── ahwa_manager
│   │   └── ahwa_manager.dart # Main facade class that coordinates application logic.
│   └── reporting
│       ├── daily_summary_report.dart # (OCP) A specific report implementation.
│       ├── report_generator.dart     # (DIP) The abstraction for all reports.
│       └── top_drinks_report.dart    # (OCP) Another specific report implementation.
└── smart_ahwa_manager_app.dart     # The application's entry point (main function).
```

## 🚀 Getting Started

### Prerequisites

  - Dart SDK installed on your machine.

### Installation & Running

1.  **Clone the repository (if applicable)**

    ```sh
    git clone https://github.com/ahmedjalambo-dev/smart_ahwa_manager_app
    cd smart_ahwa_manager_app
    ```

2.  **Install dependencies**

    ```sh
    dart pub get
    ```

3.  **Run the application**
    The main entry point simulates creating, completing, and reporting on orders.

    ```sh
    dart run lib/smart_ahwa_manager_app.dart
    ```

## 📝 Example Output

Running the application will produce the following output, demonstrating the flow of creating orders, checking the dashboard, completing orders, and generating reports.

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