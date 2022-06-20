// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';
import 'package:test_screen/src/screens/account_detail/components/invoice_avatar.dart';
import 'package:test_screen/src/utils/concurrency_types.dart';

class InvoiceTile extends StatelessWidget {
  final InvoiceData data;
  final ConcurrencyTypes concurrencyTypes;
  const InvoiceTile(
      {Key? key,
      required this.data,
      this.concurrencyTypes = ConcurrencyTypes.usd})
      : super(key: key);

  String _buildAmountString() {
    return "${data.type.toSymbol()} " +
        "${concurrencyTypes.toSymbol()}${data.amount} " +
        "${concurrencyTypes.name.toUpperCase()}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 17, top: 17, right: 15, bottom: 17),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
              bottom:
                  BorderSide(width: 2, color: Colors.grey.withOpacity(0.1)))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InvoiceAvatar(
          data: data,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.source.title,
                style:
                    Theme.of(context).textTheme.headline6?.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                DateFormat('kk:mm').format(data.date),
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
        const Spacer(),
        Text(_buildAmountString(),
            style: Theme.of(context).textTheme.headline6?.copyWith(height: 1))
      ]),
    );
  }
}
