import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/logic/bloc/account_detail/bloc.dart';
import 'package:test_screen/src/logic/bloc/invoice_history/bloc.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/screens/account_detail/components/account_info.dart';
import 'package:test_screen/src/screens/account_detail/components/history_settings.dart';
import 'package:test_screen/src/screens/account_detail/components/invoice_tile.dart';
import 'package:test_screen/src/screens/account_detail/components/list_divider.dart';
import 'package:test_screen/src/screens/placeholder/placeholder.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: BlocBuilder<AccountDetailBloc, AccountDetailState>(
        builder: (context, state) {
          if (state is AccountDetailInitState) {
            context.read<AccountDetailBloc>().add(AccountDetailFetchedEvent());
            return const PlaceHolderScreen();
          }
          if (state is AccountDetailLoadDataState) {
            return const PlaceHolderScreen();
          }
          if (state is AccountDetailShowState) {
            return _AccountDetailBody(
              settings: state.settings,
            );
          }
          throw ("Account Detail Unimplemented State");
        },
      ),
    );
  }
}

class _AccountDetailBody extends StatefulWidget {
  final AccountSettings settings;
  const _AccountDetailBody({Key? key, required this.settings})
      : super(key: key);

  @override
  State<_AccountDetailBody> createState() => _AccountDetailBodyState();
}

class _AccountDetailBodyState extends State<_AccountDetailBody> {
  DateTime? current;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceHistoryBloc, InvoiceHistoryState>(
        builder: (context, state) {
      if (state is InvoiceHistoryInitState) {
        context.read<InvoiceHistoryBloc>().add(InvoiceHistoryFetchedEvent());
        return const PlaceHolderScreen();
      }
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: AccountInfo(
            accountSettings: widget.settings,
          )),
          SliverToBoxAdapter(
            child: HistorySettings(
              accountSettings: widget.settings,
            ),
          ),
          if (state is InvoiceHistoryLoadDataState)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          if (state is InvoiceHistoryShowState)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (current?.difference(state.history[index].date).inDays !=
                      0) {
                    current = state.history[index].date;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListDivider(date: state.history[index].date),
                        InvoiceTile(data: state.history[index])
                      ],
                    );
                  }
                  return InvoiceTile(data: state.history[index]);
                },
                childCount: state.history.length,
              ),
            ),
        ],
      );
    });
  }
}
