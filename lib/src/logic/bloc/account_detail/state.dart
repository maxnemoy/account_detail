part of 'bloc.dart';

abstract class AccountDetailState extends Equatable {
  const AccountDetailState();

  @override
  List<Object> get props => [];
}

class AccountDetailInitState extends AccountDetailState {}

class AccountDetailLoadDataState extends AccountDetailState {}

class AccountDetailShowState extends AccountDetailState {
  final AccountSettings settings;

  const AccountDetailShowState(this.settings);
}
