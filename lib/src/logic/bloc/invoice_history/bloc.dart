import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/logic/models/invoice_data.dart';
import 'package:test_screen/src/logic/services/account_settings_base.dart';

part 'event.dart';
part 'state.dart';

class InvoiceHistoryBloc extends Bloc<InvoiceHistoryEvent, InvoiceHistoryState> {
  InvoiceHistoryBloc(AccountServiceBase accountServiceBase)
      : repository = accountServiceBase,
        super(InvoiceHistoryInitState()) {
    on<InvoiceHistoryFetchedEvent>(_onInvoiceHistoryFetched);
  }

  final AccountServiceBase repository;

  Future<void> _onInvoiceHistoryFetched(InvoiceHistoryFetchedEvent event,
      Emitter<InvoiceHistoryState> emitter) async {
    emitter(InvoiceHistoryLoadDataState());
    List<InvoiceData> settings = await repository.getInvoiceHistory();
    emitter(InvoiceHistoryShowState(settings));
  }
}
