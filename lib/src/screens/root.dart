import 'package:flutter/material.dart';
import 'package:test_screen/src/screens/account_detail/account_detail.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountDetailScreen(),
    );
  }
}
