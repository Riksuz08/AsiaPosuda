// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState();

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState() = _$_AuthState;
}

/// @nodoc
abstract class _$$AuthSuccessStateCopyWith<$Res> {
  factory _$$AuthSuccessStateCopyWith(
          _$AuthSuccessState value, $Res Function(_$AuthSuccessState) then) =
      __$$AuthSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String smsId, String phone, String uiPhone, Map<dynamic, dynamic> data});
}

/// @nodoc
class __$$AuthSuccessStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessState>
    implements _$$AuthSuccessStateCopyWith<$Res> {
  __$$AuthSuccessStateCopyWithImpl(
      _$AuthSuccessState _value, $Res Function(_$AuthSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smsId = null,
    Object? phone = null,
    Object? uiPhone = null,
    Object? data = null,
  }) {
    return _then(_$AuthSuccessState(
      null == smsId
          ? _value.smsId
          : smsId // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == uiPhone
          ? _value.uiPhone
          : uiPhone // ignore: cast_nullable_to_non_nullable
              as String,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$AuthSuccessState implements AuthSuccessState {
  const _$AuthSuccessState(
      this.smsId, this.phone, this.uiPhone, final Map<dynamic, dynamic> data)
      : _data = data;

  @override
  final String smsId;
  @override
  final String phone;
  @override
  final String uiPhone;
  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'AuthState.success(smsId: $smsId, phone: $phone, uiPhone: $uiPhone, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessState &&
            (identical(other.smsId, smsId) || other.smsId == smsId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.uiPhone, uiPhone) || other.uiPhone == uiPhone) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, smsId, phone, uiPhone,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessStateCopyWith<_$AuthSuccessState> get copyWith =>
      __$$AuthSuccessStateCopyWithImpl<_$AuthSuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return success(smsId, this.phone, uiPhone, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return success?.call(smsId, this.phone, uiPhone, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(smsId, this.phone, uiPhone, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccessState implements AuthState {
  const factory AuthSuccessState(
      final String smsId,
      final String phone,
      final String uiPhone,
      final Map<dynamic, dynamic> data) = _$AuthSuccessState;

  String get smsId;
  String get phone;
  String get uiPhone;
  Map<dynamic, dynamic> get data;
  @JsonKey(ignore: true)
  _$$AuthSuccessStateCopyWith<_$AuthSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLaodingStateCopyWith<$Res> {
  factory _$$AuthLaodingStateCopyWith(
          _$AuthLaodingState value, $Res Function(_$AuthLaodingState) then) =
      __$$AuthLaodingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLaodingStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLaodingState>
    implements _$$AuthLaodingStateCopyWith<$Res> {
  __$$AuthLaodingStateCopyWithImpl(
      _$AuthLaodingState _value, $Res Function(_$AuthLaodingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLaodingState implements AuthLaodingState {
  const _$AuthLaodingState();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLaodingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLaodingState implements AuthState {
  const factory AuthLaodingState() = _$AuthLaodingState;
}

/// @nodoc
abstract class _$$AuthPhoneStateCopyWith<$Res> {
  factory _$$AuthPhoneStateCopyWith(
          _$AuthPhoneState value, $Res Function(_$AuthPhoneState) then) =
      __$$AuthPhoneStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$AuthPhoneStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthPhoneState>
    implements _$$AuthPhoneStateCopyWith<$Res> {
  __$$AuthPhoneStateCopyWithImpl(
      _$AuthPhoneState _value, $Res Function(_$AuthPhoneState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$AuthPhoneState(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPhoneState implements AuthPhoneState {
  const _$AuthPhoneState(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthState.phone(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPhoneState &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPhoneStateCopyWith<_$AuthPhoneState> get copyWith =>
      __$$AuthPhoneStateCopyWithImpl<_$AuthPhoneState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return phone(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return phone?.call(this.phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this.phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return phone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return phone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (phone != null) {
      return phone(this);
    }
    return orElse();
  }
}

abstract class AuthPhoneState implements AuthState {
  const factory AuthPhoneState(final String phone) = _$AuthPhoneState;

  String get phone;
  @JsonKey(ignore: true)
  _$$AuthPhoneStateCopyWith<_$AuthPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorStateCopyWith<$Res> {
  factory _$$AuthErrorStateCopyWith(
          _$AuthErrorState value, $Res Function(_$AuthErrorState) then) =
      __$$AuthErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthErrorStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorState>
    implements _$$AuthErrorStateCopyWith<$Res> {
  __$$AuthErrorStateCopyWithImpl(
      _$AuthErrorState _value, $Res Function(_$AuthErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthErrorState implements AuthErrorState {
  const _$AuthErrorState();

  @override
  String toString() {
    return 'AuthState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)
        success,
    required TResult Function() loading,
    required TResult Function(String phone) phone,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult? Function()? loading,
    TResult? Function(String phone)? phone,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String smsId, String phone, String uiPhone,
            Map<dynamic, dynamic> data)?
        success,
    TResult Function()? loading,
    TResult Function(String phone)? phone,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(AuthSuccessState value) success,
    required TResult Function(AuthLaodingState value) loading,
    required TResult Function(AuthPhoneState value) phone,
    required TResult Function(AuthErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(AuthSuccessState value)? success,
    TResult? Function(AuthLaodingState value)? loading,
    TResult? Function(AuthPhoneState value)? phone,
    TResult? Function(AuthErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(AuthSuccessState value)? success,
    TResult Function(AuthLaodingState value)? loading,
    TResult Function(AuthPhoneState value)? phone,
    TResult Function(AuthErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthErrorState implements AuthState {
  const factory AuthErrorState() = _$AuthErrorState;
}

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthEventInitialCopyWith<$Res> {
  factory _$$AuthEventInitialCopyWith(
          _$AuthEventInitial value, $Res Function(_$AuthEventInitial) then) =
      __$$AuthEventInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventInitialCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthEventInitial>
    implements _$$AuthEventInitialCopyWith<$Res> {
  __$$AuthEventInitialCopyWithImpl(
      _$AuthEventInitial _value, $Res Function(_$AuthEventInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventInitial implements AuthEventInitial {
  const _$AuthEventInitial();

  @override
  String toString() {
    return 'AuthEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthEventInitial implements AuthEvent {
  const factory AuthEventInitial() = _$AuthEventInitial;
}

/// @nodoc
abstract class _$$AuthPhoneChangeEventCopyWith<$Res> {
  factory _$$AuthPhoneChangeEventCopyWith(_$AuthPhoneChangeEvent value,
          $Res Function(_$AuthPhoneChangeEvent) then) =
      __$$AuthPhoneChangeEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$AuthPhoneChangeEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthPhoneChangeEvent>
    implements _$$AuthPhoneChangeEventCopyWith<$Res> {
  __$$AuthPhoneChangeEventCopyWithImpl(_$AuthPhoneChangeEvent _value,
      $Res Function(_$AuthPhoneChangeEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AuthPhoneChangeEvent(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthPhoneChangeEvent implements AuthPhoneChangeEvent {
  const _$AuthPhoneChangeEvent(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'AuthEvent.phoneChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPhoneChangeEvent &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPhoneChangeEventCopyWith<_$AuthPhoneChangeEvent> get copyWith =>
      __$$AuthPhoneChangeEventCopyWithImpl<_$AuthPhoneChangeEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return phoneChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return phoneChanged?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class AuthPhoneChangeEvent implements AuthEvent {
  const factory AuthPhoneChangeEvent(final String value) =
      _$AuthPhoneChangeEvent;

  String get value;
  @JsonKey(ignore: true)
  _$$AuthPhoneChangeEventCopyWith<_$AuthPhoneChangeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthCheckMessageEventCopyWith<$Res> {
  factory _$$AuthCheckMessageEventCopyWith(_$AuthCheckMessageEvent value,
          $Res Function(_$AuthCheckMessageEvent) then) =
      __$$AuthCheckMessageEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$AuthCheckMessageEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckMessageEvent>
    implements _$$AuthCheckMessageEventCopyWith<$Res> {
  __$$AuthCheckMessageEventCopyWithImpl(_$AuthCheckMessageEvent _value,
      $Res Function(_$AuthCheckMessageEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$AuthCheckMessageEvent(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthCheckMessageEvent implements AuthCheckMessageEvent {
  const _$AuthCheckMessageEvent(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthEvent.checkMessage(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckMessageEvent &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCheckMessageEventCopyWith<_$AuthCheckMessageEvent> get copyWith =>
      __$$AuthCheckMessageEventCopyWithImpl<_$AuthCheckMessageEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String value) phoneChanged,
    required TResult Function(String phone) checkMessage,
  }) {
    return checkMessage(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String value)? phoneChanged,
    TResult? Function(String phone)? checkMessage,
  }) {
    return checkMessage?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String value)? phoneChanged,
    TResult Function(String phone)? checkMessage,
    required TResult orElse(),
  }) {
    if (checkMessage != null) {
      return checkMessage(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(AuthPhoneChangeEvent value) phoneChanged,
    required TResult Function(AuthCheckMessageEvent value) checkMessage,
  }) {
    return checkMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult? Function(AuthCheckMessageEvent value)? checkMessage,
  }) {
    return checkMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(AuthPhoneChangeEvent value)? phoneChanged,
    TResult Function(AuthCheckMessageEvent value)? checkMessage,
    required TResult orElse(),
  }) {
    if (checkMessage != null) {
      return checkMessage(this);
    }
    return orElse();
  }
}

abstract class AuthCheckMessageEvent implements AuthEvent {
  const factory AuthCheckMessageEvent(final String phone) =
      _$AuthCheckMessageEvent;

  String get phone;
  @JsonKey(ignore: true)
  _$$AuthCheckMessageEventCopyWith<_$AuthCheckMessageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
