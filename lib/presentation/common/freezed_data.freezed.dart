// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFreezed {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFreezedCopyWith<LoginFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFreezedCopyWith<$Res> {
  factory $LoginFreezedCopyWith(
          LoginFreezed value, $Res Function(LoginFreezed) then) =
      _$LoginFreezedCopyWithImpl<$Res, LoginFreezed>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginFreezedCopyWithImpl<$Res, $Val extends LoginFreezed>
    implements $LoginFreezedCopyWith<$Res> {
  _$LoginFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFreezedCopyWith<$Res>
    implements $LoginFreezedCopyWith<$Res> {
  factory _$$_LoginFreezedCopyWith(
          _$_LoginFreezed value, $Res Function(_$_LoginFreezed) then) =
      __$$_LoginFreezedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginFreezedCopyWithImpl<$Res>
    extends _$LoginFreezedCopyWithImpl<$Res, _$_LoginFreezed>
    implements _$$_LoginFreezedCopyWith<$Res> {
  __$$_LoginFreezedCopyWithImpl(
      _$_LoginFreezed _value, $Res Function(_$_LoginFreezed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginFreezed(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginFreezed implements _LoginFreezed {
  _$_LoginFreezed(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginFreezed(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFreezed &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFreezedCopyWith<_$_LoginFreezed> get copyWith =>
      __$$_LoginFreezedCopyWithImpl<_$_LoginFreezed>(this, _$identity);
}

abstract class _LoginFreezed implements LoginFreezed {
  factory _LoginFreezed(final String username, final String password) =
      _$_LoginFreezed;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFreezedCopyWith<_$_LoginFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}
