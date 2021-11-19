import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:etherwallet/model/login_info.dart';
import 'package:etherwallet/model/wallet_setup.dart';
import 'package:etherwallet/service/address_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:steel_crypt/steel_crypt.dart';

import 'wallet_setup_state.dart';

class WalletSetupHandler {
  WalletSetupHandler(this._store, this._addressService);

  final Store<WalletSetup, WalletSetupAction> _store;
  final AddressService _addressService;
  final LogInInfo _logInInfo = LogInInfo();

  LogInInfo get logInInfo => _logInInfo;
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

  /// Creates a private key from a salt and a secret.
  ///
  /// Private key is a [hex string].
  String _createPrivateKey(String salt, String secret) {
    // [PassCrypt] cannot handle [utf8 string] and we want to use the full
    // keyboard. So, we skip a conversion ([hex string] to [Uint8List]) by
    // [convert] our [utf8 string] directly to [Uint8List] and use
    // [PassCryptRaw].
    final saltRaw = _stringToUint8List(salt);
    final secretRaw = _stringToUint8List(secret);

    final privateKeyRaw = PassCryptRaw.scrypt()
        .hash(salt: saltRaw, plain: secretRaw /* 'plain password' */);

    return _uint8ListToHexString(privateKeyRaw);
  }

  Future<bool> logIn() async {
    final privateKey = _createPrivateKey(
        _logInInfo.username! /* salt */, _logInInfo.password! /* secret */);

    return _importFromPrivateKey(privateKey);
  }
}
