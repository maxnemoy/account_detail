import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/config/singleton.dart';
import 'package:test_screen/src/logic/bloc/account_detail/bloc.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/services/account_settings_base.dart';
import 'package:test_screen/src/screens/components/brand_button.dart';

class AccountInfo extends StatelessWidget {
  final AccountSettings accountSettings;
  const AccountInfo({Key? key, required this.accountSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "USD Account",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    child: BrandButton(
                      child: Text(accountSettings.showHeaderInfo ? "Hide" : "Show"),
                      onPressed: () {
                        context.read<AccountDetailBloc>().add(
                            AccountDetailChangedEvent(accountSettings.copyWith(
                                    showHeaderInfo: !accountSettings.showHeaderInfo)));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity:
                accountSettings.showHeaderInfo
                    ? 1
                    : 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$ 120,930.59",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
