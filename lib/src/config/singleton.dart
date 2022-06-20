import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:test_screen/src/logic/api/api.dart';
import 'package:test_screen/src/logic/services/account_settings_base.dart';


final singleton = GetIt.instance;

FutureOr<void> initServices(ApiClient apiClient) async {
  singleton.registerSingleton<AccountService>(AccountService(apiClient));

  await singleton.allReady();
}