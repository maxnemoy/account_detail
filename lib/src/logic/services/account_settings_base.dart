import 'package:flutter/cupertino.dart';
import 'package:test_screen/src/logic/api/api.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';

part 'account_settings.dart';

abstract class AccountServiceBase {
  final ApiClient apiClient;
  AccountServiceBase(this.apiClient);

  @protected
  AccountSettings? _accountSettings;
  @protected
  List<InvoiceData>? _historyList;

  Future<AccountSettings> getAccountSettings();
  Future<AccountSettings> saveAccountSettings(AccountSettings settings);
  Future<List<InvoiceData>> getInvoiceHistory();
}
