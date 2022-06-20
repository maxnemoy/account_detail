import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/logic/bloc/account_detail/bloc.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';
import 'package:test_screen/src/screens/components/brand_button.dart';
import 'package:test_screen/src/screens/components/brand_dropdown.dart';
import 'package:test_screen/src/utils/concurrency_types.dart';

class HistorySettings extends StatelessWidget {
  final AccountSettings accountSettings;

  const HistorySettings({Key? key, required this.accountSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Transactions History",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey[200], fontSize: 18),
          ),
          const SizedBox(
            height: 13,
          ),
          BrandDropDownButton<ConcurrencyTypes>(
            value: accountSettings.concurrencyType,
            items: ConcurrencyTypes.values
                .map((e) => DropdownMenuItem<ConcurrencyTypes>(
                      value: e,
                      child: Text(
                        e.toName(),
                      ),
                    ))
                .toList(),
            onSelected: (v) {
              context.read<AccountDetailBloc>().add(AccountDetailChangedEvent(
                  accountSettings.copyWith(concurrencyType: v)));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              children: [
                Expanded(
                  child: BrandDropDownButton<InvoiceTypes>(
                    value: accountSettings.invoiceType,
                    items: InvoiceTypes.values
                        .map((e) => DropdownMenuItem<InvoiceTypes>(
                              value: e,
                              child: Text(
                                e.toName(),
                              ),
                            ))
                        .toList(),
                    onSelected: (v) {
                      context
                          .read<AccountDetailBloc>()
                          .add(AccountDetailChangedEvent(accountSettings.copyWith(invoiceType: v)));
                    },
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                BrandButton(
                  child: const SizedBox(
                      height: 34, child: Icon(CupertinoIcons.calendar)),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
