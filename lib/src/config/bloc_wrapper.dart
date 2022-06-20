import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/config/singleton.dart';
import 'package:test_screen/src/logic/bloc/account_detail/bloc.dart';
import 'package:test_screen/src/logic/bloc/invoice_history/bloc.dart';
import 'package:test_screen/src/logic/services/account_settings_base.dart';

class BlocWrapper extends StatelessWidget {
  const BlocWrapper({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: true,
            create: (_) => AccountDetailBloc(singleton.get<AccountService>())),
        BlocProvider(
            lazy: true,
            create: (_) => InvoiceHistoryBloc(singleton.get<AccountService>())),
      ],
      child: child!,
    );
  }
}
