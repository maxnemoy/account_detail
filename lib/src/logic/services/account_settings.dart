part of 'account_settings_base.dart';

class AccountService extends AccountServiceBase {
  AccountService(super.apiClient);

  AccountSettings? get accountSettings => _accountSettings;
  List<InvoiceData>? get historyList => _historyList;

  @override
  Future<AccountSettings> getAccountSettings() async {
    _accountSettings = await apiClient.fetchAccountSettings();
    return _accountSettings!;
  }

  @override
  Future<List<InvoiceData>> getInvoiceHistory() async {
    _historyList = await apiClient.fetchInvoiceHistory();
    return _historyList!;
  }

  @override
  Future<AccountSettings> saveAccountSettings(AccountSettings settings) async {
    _accountSettings = await apiClient.saveAccountSettings(settings);
    return _accountSettings!;
  }
}
