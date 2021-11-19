// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogInInfo extends LogInInfo {
  @override
  final String? username;
  @override
  final String? passphrase;
  @override
  final int? pin;

  factory _$LogInInfo([void Function(LogInInfoBuilder)? updates]) =>
      (new LogInInfoBuilder()..update(updates)).build();

  _$LogInInfo._({this.username, this.passphrase, this.pin}) : super._();

  @override
  LogInInfo rebuild(void Function(LogInInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogInInfoBuilder toBuilder() => new LogInInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogInInfo &&
        username == other.username &&
        passphrase == other.passphrase &&
        pin == other.pin;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, username.hashCode), passphrase.hashCode), pin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LogInInfo')
          ..add('username', username)
          ..add('passphrase', passphrase)
          ..add('pin', pin))
        .toString();
  }
}

class LogInInfoBuilder implements Builder<LogInInfo, LogInInfoBuilder> {
  _$LogInInfo? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _passphrase;
  String? get passphrase => _$this._passphrase;
  set passphrase(String? passphrase) => _$this._passphrase = passphrase;

  int? _pin;
  int? get pin => _$this._pin;
  set pin(int? pin) => _$this._pin = pin;

  LogInInfoBuilder();

  LogInInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _passphrase = $v.passphrase;
      _pin = $v.pin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogInInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogInInfo;
  }

  @override
  void update(void Function(LogInInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LogInInfo build() {
    final _$result = _$v ??
        new _$LogInInfo._(username: username, passphrase: passphrase, pin: pin);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
