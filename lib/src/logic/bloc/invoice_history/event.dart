part of 'bloc.dart';

abstract class InvoiceHistoryEvent extends Equatable {
  const InvoiceHistoryEvent();

  @override
  List<Object> get props => [];
}

class InvoiceHistoryFetchedEvent extends InvoiceHistoryEvent{}