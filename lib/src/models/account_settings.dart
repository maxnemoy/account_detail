import 'package:test_screen/src/models/invoice_data.dart';
import 'package:test_screen/src/utils/concurrency_types.dart';

class AccountSettings {
  final bool showHeaderInfo;
  final InvoiceTypes invoiceType;
  final ConcurrencyTypes concurrencyType;

  AccountSettings(
      {this.showHeaderInfo = true,
      this.invoiceType = InvoiceTypes.all,
      this.concurrencyType = ConcurrencyTypes.usd});

  AccountSettings copyWith({bool? showHeaderInfo, InvoiceTypes? invoiceType,
          ConcurrencyTypes? concurrencyType}) =>
      AccountSettings(
          showHeaderInfo: showHeaderInfo ?? this.showHeaderInfo,
          invoiceType: invoiceType ?? this.invoiceType,
          concurrencyType: concurrencyType ?? this.concurrencyType);
}
