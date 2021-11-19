import 'package:built_value/built_value.dart';

part 'login_info.g.dart';

abstract class LogInInfo implements Built<LogInInfo, LogInInfoBuilder> {
  factory LogInInfo([void Function(LogInInfoBuilder)? updates]) = _$LogInInfo;

  LogInInfo._();

  String? get username;
  String? get passphrase;
  int? get pin;

  bool get isInputPending =>
      (username == null) || (passphrase == null) || (pin == null);
}
