import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_screen/src/logic/models/account_settings.dart';
import 'package:test_screen/src/logic/services/account_settings_base.dart';

part 'event.dart';
part 'state.dart';

class AccountDetailBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  AccountDetailBloc(AccountServiceBase accountServiceBase)
      : repository = accountServiceBase,
        super(AccountDetailInitState()) {
    on<AccountDetailFetchedEvent>(_onAccountDetailFetched);
    on<AccountDetailChangedEvent>(_onAccountDetailChanged);
  }

  final AccountServiceBase repository;

  Future<void> _onAccountDetailFetched(AccountDetailFetchedEvent event,
      Emitter<AccountDetailState> emitter) async {
    emitter(AccountDetailLoadDataState());
    AccountSettings settings = await repository.getAccountSettings();
    emitter(AccountDetailShowState(settings));
  }

  Future<void> _onAccountDetailChanged(AccountDetailChangedEvent event,
      Emitter<AccountDetailState> emitter) async {
    emitter(AccountDetailLoadDataState());
    AccountSettings settings = await repository.saveAccountSettings(event.settings);
    emitter(AccountDetailShowState(settings));
  }
}
