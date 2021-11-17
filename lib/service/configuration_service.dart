import 'package:shared_preferences/shared_preferences.dart';

abstract class IConfigurationService {
  Future<void> setupDone(bool value);
  Future<void> setPrivateKey(String? value);
  String? getPrivateKey();
  bool didSetupWallet();
}

class ConfigurationService implements IConfigurationService {
  const ConfigurationService(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> setPrivateKey(String? value) async {
    await _preferences.setString('privateKey', value ?? '');
  }

  @override
  Future<void> setupDone(bool value) async {
    await _preferences.setBool('didSetupWallet', value);
  }

  @override
  String? getPrivateKey() {
    return _preferences.getString('privateKey');
  }

  @override
  bool didSetupWallet() {
    return _preferences.getBool('didSetupWallet') ?? false;
  }
}
