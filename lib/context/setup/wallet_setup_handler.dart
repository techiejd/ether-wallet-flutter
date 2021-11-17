import 'dart:async';

import 'package:etherwallet/model/wallet_setup.dart';
import 'package:etherwallet/service/address_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'wallet_setup_state.dart';

class WalletSetupHandler {
  WalletSetupHandler(this._store, this._addressService);

  final Store<WalletSetup, WalletSetupAction> _store;
  final AddressService _addressService;

  WalletSetup get state => _store.state;

  Future<bool> _importFromPrivateKey(String privateKey) async {
    try {
      _store.dispatch(WalletSetupStarted());

      await _addressService.setupFromPrivateKey(privateKey);
      return true;
    } catch (e) {
      _store.dispatch(WalletSetupAddError(e.toString()));
    }

    _store.dispatch(
        WalletSetupAddError('Invalid private key, please try again.'));

    return false;
  }

  Future<bool> logIn(String username, String passphrase) async {
    String privateKey = "";
    return _importFromPrivateKey(privateKey);
  }
}
