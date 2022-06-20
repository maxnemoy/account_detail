enum SourceType { company, person }

class InvoiceSourceData {
  final String title;
  final String? logo;
  final SourceType type;

  InvoiceSourceData({String? title, this.logo, required this.type})
      : title = title ?? "Undefined sender";
}

enum InvoiceType { expense, refill }

class UndefinedInvoiceType extends Error {}

extension InvoiceTypeExtensions on InvoiceType {
  String toSymbol() {
    switch (this) {
      case InvoiceType.expense:
        return "-";
      case InvoiceType.refill:
        return "+";
      default:
        throw UndefinedInvoiceType();
    }
  }
}

class InvoiceData {
  final DateTime date;
  final InvoiceSourceData source;
  final InvoiceType type;
  final double amount;

  InvoiceData(
      {required this.date,
      required this.source,
      required this.type,
      required this.amount});
}

List<InvoiceSourceData> sourceList = [
  InvoiceSourceData(type: SourceType.person, title: "maxnemoy"),
  InvoiceSourceData(
      type: SourceType.company,
      title: "McDonald's",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/1200px-McDonald%27s_Golden_Arches.svg.png"),
  InvoiceSourceData(
      type: SourceType.company,
      title: "LouisVuitton",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Louis_Vuitton_Icon.svg/1200px-Louis_Vuitton_Icon.svg.png"),
  InvoiceSourceData(
      type: SourceType.company,
      title: "Starbucks",
      logo:
          "https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/2048px-Starbucks_Coffee_Logo.svg.png"),
  InvoiceSourceData(
      type: SourceType.company,
      title: "Nike",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Logo_NIKE.svg/1024px-Logo_NIKE.svg.png"),
  InvoiceSourceData(
      type: SourceType.company,
      title: "Virgin Megastore",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Virgin-logo.svg/2341px-Virgin-logo.svg.png"),
];

List<InvoiceData> dataList = [
  InvoiceData(
      amount: 12.54,
      date: DateTime.now(),
      source: sourceList[0],
      type: InvoiceType.refill),
  InvoiceData(
      amount: 22.2,
      date: DateTime.now(),
      source: sourceList[1],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 43.72,
      date: DateTime.now().subtract(const Duration(days: 1)),
      source: sourceList[2],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 322.2,
      date: DateTime.now().subtract(const Duration(days: 1)),
      source: sourceList[0],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 76.65,
      date: DateTime.now().subtract(const Duration(days: 1)),
      source: sourceList[3],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 23.52,
      date: DateTime.now().subtract(const Duration(days: 2)),
      source: sourceList[4],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 233.83,
      date: DateTime.now().subtract(const Duration(days: 3)),
      source: sourceList[0],
      type: InvoiceType.refill),
  InvoiceData(
      amount: 55.24,
      date: DateTime.now().subtract(const Duration(days: 3)),
      source: sourceList[5],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 23.52,
      date: DateTime.now().subtract(const Duration(days: 3)),
      source: sourceList[4],
      type: InvoiceType.expense),
  InvoiceData(
      amount: 233.83,
      date: DateTime.now().subtract(const Duration(days: 4)),
      source: sourceList[0],
      type: InvoiceType.refill),
  InvoiceData(
      amount: 55.24,
      date: DateTime.now().subtract(const Duration(days: 5)),
      source: sourceList[5],
      type: InvoiceType.expense),
];
