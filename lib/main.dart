import 'package:flutter/material.dart';
import 'package:test_screen/src/config/singleton.dart';
import 'package:test_screen/src/logic/api/api_mock.dart';
import 'package:test_screen/src/screens/root.dart';

void main() async {
  await initServices(ApiClientMock());
  runApp(const App());
}
