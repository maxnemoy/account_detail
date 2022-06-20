import 'package:flutter/material.dart';
import 'package:test_screen/src/config/bloc_wrapper.dart';
import 'package:test_screen/src/config/theme_data.dart';
import 'package:test_screen/src/screens/account_detail/account_detail.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BrandTheme.defaultTheme,
      home: Builder(
        builder: (context) => const BlocWrapper(
          child: AccountDetailScreen(),
        ),
      ),
    );
  }
}
