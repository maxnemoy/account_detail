part of 'bloc.dart';

abstract class AccountDetailEvent extends Equatable {
  const AccountDetailEvent();

  @override
  List<Object> get props => [];
}

class AccountDetailFetchedEvent extends AccountDetailEvent {}

class AccountDetailChangedEvent extends AccountDetailEvent {
  final AccountSettings settings;

  const AccountDetailChangedEvent(this.settings);
}
