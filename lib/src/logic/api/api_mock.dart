import 'package:mockito/mockito.dart' show Mock;
import 'package:test_screen/src/logic/api/api.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';

class ApiClientMock extends Mock implements ApiClient {
  @override
  Future<AccountSettings> fetchAccountSettings() async {
    await Future.delayed(const Duration(seconds: 1));
    return AccountSettings();
  }
  @override
  Future<AccountSettings> saveAccountSettings(AccountSettings settings) async {
    return settings;
  }

  @override
  Future<List<InvoiceData>> fetchInvoiceHistory() async {
    await Future.delayed(const Duration(seconds: 3));
    return dataList;
  }
}
