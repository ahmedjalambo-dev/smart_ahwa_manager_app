abstract class Drink {
  String get name;
  double get price;
}

/// Concrete implementation for "Shai" (Tea).
class Shai extends Drink {
  @override
  String get name => 'Shai';
  @override
  double get price => 5.0;
}

/// Concrete implementation for "Turkish Coffee".
class TurkishCoffee extends Drink {
  @override
  String get name => 'Turkish Coffee';
  @override
  double get price => 10.0;
}

/// Concrete implementation for "Hibiscus Tea".
class HibiscusTea extends Drink {
  @override
  String get name => 'Hibiscus Tea';
  @override
  double get price => 7.5;
}
