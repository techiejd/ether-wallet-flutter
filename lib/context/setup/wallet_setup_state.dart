import 'package:etherwallet/model/wallet_setup.dart';

abstract class WalletSetupAction {}

class WalletSetupInit implements WalletSetupAction {}

class WalletSetupAddError implements WalletSetupAction {
  WalletSetupAddError(this.error);
  final String error;
}

class WalletSetupStarted implements WalletSetupAction {}

WalletSetup reducer(WalletSetup state, WalletSetupAction action) {
  if (action is WalletSetupInit) {
    return WalletSetup();
  }

  if (action is WalletSetupStarted) {
    return state.rebuild((b) => b
      ..errors.clear()
      ..loading = true);
  }

  if (action is WalletSetupAddError)
    return state.rebuild((b) => b
      ..loading = false
      ..errors.clear()
      ..errors.add(action.error));

  return state;
}
