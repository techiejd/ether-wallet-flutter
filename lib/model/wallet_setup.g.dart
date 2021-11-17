// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_setup.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WalletSetup extends WalletSetup {
  @override
  final String? privateKey;
  @override
  final bool loading;
  @override
  final BuiltList<String>? errors;

  factory _$WalletSetup([void Function(WalletSetupBuilder)? updates]) =>
      (new WalletSetupBuilder()..update(updates)).build();

  _$WalletSetup._({this.privateKey, required this.loading, this.errors})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(loading, 'WalletSetup', 'loading');
  }

  @override
  WalletSetup rebuild(void Function(WalletSetupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletSetupBuilder toBuilder() => new WalletSetupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletSetup &&
        privateKey == other.privateKey &&
        loading == other.loading &&
        errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, privateKey.hashCode), loading.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WalletSetup')
          ..add('privateKey', privateKey)
          ..add('loading', loading)
          ..add('errors', errors))
        .toString();
  }
}

class WalletSetupBuilder implements Builder<WalletSetup, WalletSetupBuilder> {
  _$WalletSetup? _$v;

  String? _privateKey;
  String? get privateKey => _$this._privateKey;
  set privateKey(String? privateKey) => _$this._privateKey = privateKey;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(ListBuilder<String>? errors) => _$this._errors = errors;

  WalletSetupBuilder();

  WalletSetupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _privateKey = $v.privateKey;
      _loading = $v.loading;
      _errors = $v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletSetup other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletSetup;
  }

  @override
  void update(void Function(WalletSetupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WalletSetup build() {
    _$WalletSetup _$result;
    try {
      _$result = _$v ??
          new _$WalletSetup._(
              privateKey: privateKey,
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, 'WalletSetup', 'loading'),
              errors: _errors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WalletSetup', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
