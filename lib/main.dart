import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_screen/src/models/invoice_data.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  DateTime? current;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.share),
            onPressed: () {},
          )
        ],
      ),
      body: CustomScrollView(
        //fit: StackFit.loose,
        slivers: [
          const SliverToBoxAdapter(child: AccountInfo()),
          const SliverToBoxAdapter(
            child: SelectionZone(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (current?.difference(dataList[index].date).inDays != 0) {
                  current = dataList[index].date;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListDivider(date: dataList[index].date),
                      InvoiceTile(data: dataList[index])
                    ],
                  );
                }

                return InvoiceTile(data: dataList[index]);
              },
              childCount: dataList.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ListDivider extends StatelessWidget {
  final DateTime date;
  const ListDivider({Key? key, required this.date}) : super(key: key);
  
  String _buildText(){
    switch (DateTime.now().difference(date).inDays) {
      case 0:
        return "Today";
      case 1:
        return "Yesterday";
      default:
      return DateFormat('EEE, MMM dd').format(date);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      width: double.infinity,
      color: Colors.grey[400],
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _buildText(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}

enum ConcurrencyTypes { usd, rub }

class UndefinedConcurrencyType extends Error {}

extension ConcurrencyTypesExtensions on ConcurrencyTypes {
  String toSymbol() {
    switch (this) {
      case ConcurrencyTypes.usd:
        return "\$";
      case ConcurrencyTypes.rub:
        return "₽";
      default:
        throw UndefinedConcurrencyType();
    }
  }
}

class InvoiceTile extends StatelessWidget {
  final InvoiceData data;
  final ConcurrencyTypes concurrencyTypes;
  const InvoiceTile(
      {Key? key,
      required this.data,
      this.concurrencyTypes = ConcurrencyTypes.usd})
      : super(key: key);

  String _buildAmountString() {
    return "${data.type.toSymbol()} ${concurrencyTypes.toSymbol()}${data.amount} ${concurrencyTypes.name.toUpperCase()}";
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

class InvoiceAvatar extends StatelessWidget {
  final InvoiceData data;
  const InvoiceAvatar({Key? key, required this.data}) : super(key: key);
  Color getRandomColor() => Color(Random().nextInt(0xffffffff));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        //color: Colors.red,
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(2),
        decoration: data.source.type == SourceType.person
            ? const BoxDecoration(
                color: Colors.transparent,
                border: Border.fromBorderSide(
                    BorderSide(width: 1, color: Colors.black)),
                borderRadius: BorderRadius.all(Radius.circular(15)))
            : BoxDecoration(color: getRandomColor()),
        child: data.source.type == SourceType.company
            ? Image.network(
                data.source.logo ??
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Picture_icon_BLACK.svg/1200px-Picture_icon_BLACK.svg.png",
                filterQuality: FilterQuality.medium,
                fit: BoxFit.fitWidth,
              )
            : Icon(data.type == InvoiceType.refill
                ? CupertinoIcons.arrow_left
                : CupertinoIcons.arrow_right),
      ),
    );
  }
}

class SelectionZone extends StatelessWidget {
  const SelectionZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
          ElevatedButton(onPressed: () {}, child: Text("asd"))
        ]),
      ),
    );
  }
}

class AccountInfo extends StatelessWidget {
  const AccountInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.black,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: Colors.grey[300],
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      side: BorderSide(
                          width: 1.0, color: Colors.grey.withOpacity(0.3)),
                    ),
                    child: Text("Hide"),
                    onPressed: () {
                      debugPrint("asd");
                    },
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\$ 120,930.59",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ])));
  }
}
