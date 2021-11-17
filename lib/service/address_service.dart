import 'package:etherwallet/service/configuration_service.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:convert/convert.dart';
import 'package:web3dart/credentials.dart';

abstract class IAddressService {
  Future<EthereumAddress> getPublicAddress(String privateKey);
  Future<bool> setupFromPrivateKey(String privateKey);
}

class AddressService implements IAddressService {
  const AddressService(this._configService);

  final IConfigurationService _configService;

  @override
  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);

    final address = await private.extractAddress();
    print('address: $address');
    return address;
  }

  @override
  Future<bool> setupFromPrivateKey(String privateKey) async {
    await _configService.setPrivateKey(privateKey);
    await _configService.setupDone(true);
    return true;
  }
}
