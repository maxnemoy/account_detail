import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/config/theme_data.dart';

import 'package:test_screen/src/logic/bloc/account_detail/bloc.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/screens/components/brand_button.dart';
import 'package:test_screen/src/utils/double_formatter.dart';

class AccountInfo extends StatelessWidget {
  final AccountSettings accountSettings;
  const AccountInfo({Key? key, required this.accountSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/2560px-Flag_of_the_United_States.svg.png",
                filterQuality: FilterQuality.medium,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  "USD Account",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          BrandTheme.defaultColorScheme.surface.withOpacity(.5),
                      fontSize: 18),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    child: BrandButton(
                      child: Text(
                          accountSettings.showHeaderInfo ? "Hide" : "Show"),
                      onPressed: () {
                        context.read<AccountDetailBloc>().add(
                              AccountDetailChangedEvent(
                                accountSettings.copyWith(
                                    showHeaderInfo:
                                        !accountSettings.showHeaderInfo),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: accountSettings.showHeaderInfo ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$  ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: BrandTheme.defaultColorScheme.background)),
                  Text(
                    accountSettings.totalAmount.toFormattedString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: BrandTheme.defaultColorScheme.background,
                        fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
