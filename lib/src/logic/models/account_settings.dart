
import 'package:test_screen/src/logic/models/invoice_data.dart';
import 'package:test_screen/src/utils/concurrency_types.dart';

class AccountSettings {
  final bool showHeaderInfo;
  final double totalAmount;
  final InvoiceTypes invoiceType;
  final ConcurrencyTypes concurrencyType;

  AccountSettings(
      {this.showHeaderInfo = true,
      this.totalAmount = 180970.8343,
      this.invoiceType = InvoiceTypes.all,
      this.concurrencyType = ConcurrencyTypes.usd});

  AccountSettings copyWith({bool? showHeaderInfo, InvoiceTypes? invoiceType,
          ConcurrencyTypes? concurrencyType}) =>
      AccountSettings(
          showHeaderInfo: showHeaderInfo ?? this.showHeaderInfo,
          invoiceType: invoiceType ?? this.invoiceType,
          concurrencyType: concurrencyType ?? this.concurrencyType);
}
