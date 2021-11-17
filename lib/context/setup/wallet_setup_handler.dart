import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:etherwallet/model/wallet_setup.dart';
import 'package:etherwallet/service/address_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:steel_crypt/steel_crypt.dart';

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

  Uint8List _stringToUint8List(String input) {
    return Uint8List.fromList(utf8.encode(input));
  }

  String _uint8ListToHexString(Uint8List input) {
    return '0x' + hex.encode(input);
  }

  String _createPrivateKey(String username, String passphrase) {
    final salt = _stringToUint8List(username);
    final password = _stringToUint8List(passphrase);

    final secret = PassCryptRaw.scrypt().hash(salt: salt, plain: password);

    return _uint8ListToHexString(secret);
  }

  Future<bool> logIn(String username, String passphrase) async {
    final privateKey = _createPrivateKey(username, passphrase);

    return _importFromPrivateKey(privateKey);
  }
}
