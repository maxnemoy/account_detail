part of 'bloc.dart';

abstract class InvoiceHistoryState extends Equatable {
  const InvoiceHistoryState();

  @override
  List<Object> get props => [];
}

class InvoiceHistoryInitState extends InvoiceHistoryState {}

class InvoiceHistoryLoadDataState extends InvoiceHistoryState {}

class InvoiceHistoryShowState extends InvoiceHistoryState {
  final List<InvoiceData> history;

  const InvoiceHistoryShowState(this.history);
}
