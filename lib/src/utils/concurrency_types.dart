enum ConcurrencyTypes { usd, rub }

class UndefinedConcurrencyType extends Error {}

extension ConcurrencyTypesExtensions on ConcurrencyTypes {
  String toSymbol() {
    switch (this) {
      case ConcurrencyTypes.usd:
        return "\$";
      case ConcurrencyTypes.rub:
        return "₽";
      default:
        throw UndefinedConcurrencyType();
    }
  }
  String toName() {
    switch (this) {
      case ConcurrencyTypes.usd:
        return "USD Dollar";
      case ConcurrencyTypes.rub:
        return "RUB Ruble";
      default:
        throw UndefinedConcurrencyType();
    }
  }
}