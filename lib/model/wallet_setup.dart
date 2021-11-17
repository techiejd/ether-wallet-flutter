import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'wallet_setup.g.dart';

abstract class WalletSetup implements Built<WalletSetup, WalletSetupBuilder> {
  factory WalletSetup([void Function(WalletSetupBuilder)? updates]) =>
      _$WalletSetup((b) => b
        ..loading = false
        ..errors = BuiltList<String>().toBuilder()
        ..update(updates));

  WalletSetup._();

  String? get privateKey;

  bool get loading;
  BuiltList<String>? get errors;
}
