import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen/src/models/invoice_data.dart';
import 'package:test_screen/src/screens/account_detail/components/account_info.dart';
import 'package:test_screen/src/screens/account_detail/components/history_settings.dart';
import 'package:test_screen/src/screens/account_detail/components/invoice_tile.dart';
import 'package:test_screen/src/screens/account_detail/components/list_divider.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({Key? key}) : super(key: key);

  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
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
            child: HistorySettings(),
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
