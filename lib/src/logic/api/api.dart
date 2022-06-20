import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';

abstract class ApiClient {
  Future<AccountSettings> fetchAccountSettings();
  Future<AccountSettings> saveAccountSettings(AccountSettings settings);
  Future<List<InvoiceData>> fetchInvoiceHistory();
}
