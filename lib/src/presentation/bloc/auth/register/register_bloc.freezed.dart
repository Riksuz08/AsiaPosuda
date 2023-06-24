// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(RegisterUserRequest request) userRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(RegisterUserRequest request)? userRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(RegisterUserRequest request)? userRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserRegisterEvent value) userRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserRegisterEvent value)? userRegister,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserRegisterEvent value)? userRegister,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'RegisterEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(RegisterUserRequest request) userRegister,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(RegisterUserRequest request)? userRegister,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(RegisterUserRequest request)? userRegister,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserRegisterEvent value) userRegister,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserRegisterEvent value)? userRegister,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserRegisterEvent value)? userRegister,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RegisterEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$UserRegisterEventCopyWith<$Res> {
  factory _$$UserRegisterEventCopyWith(
          _$UserRegisterEvent value, $Res Function(_$UserRegisterEvent) then) =
      __$$UserRegisterEventCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterUserRequest request});
}

/// @nodoc
class __$$UserRegisterEventCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$UserRegisterEvent>
    implements _$$UserRegisterEventCopyWith<$Res> {
  __$$UserRegisterEventCopyWithImpl(
      _$UserRegisterEvent _value, $Res Function(_$UserRegisterEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$UserRegisterEvent(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as RegisterUserRequest,
    ));
  }
}

/// @nodoc

class _$UserRegisterEvent implements UserRegisterEvent {
  const _$UserRegisterEvent({required this.request});

  @override
  final RegisterUserRequest request;

  @override
  String toString() {
    return 'RegisterEvent.userRegister(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterEvent &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterEventCopyWith<_$UserRegisterEvent> get copyWith =>
      __$$UserRegisterEventCopyWithImpl<_$UserRegisterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(RegisterUserRequest request) userRegister,
  }) {
    return userRegister(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(RegisterUserRequest request)? userRegister,
  }) {
    return userRegister?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(RegisterUserRequest request)? userRegister,
    required TResult orElse(),
  }) {
    if (userRegister != null) {
      return userRegister(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(UserRegisterEvent value) userRegister,
  }) {
    return userRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(UserRegisterEvent value)? userRegister,
  }) {
    return userRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(UserRegisterEvent value)? userRegister,
    required TResult orElse(),
  }) {
    if (userRegister != null) {
      return userRegister(this);
    }
    return orElse();
  }
}

abstract class UserRegisterEvent implements RegisterEvent {
  const factory UserRegisterEvent(
      {required final RegisterUserRequest request}) = _$UserRegisterEvent;

  RegisterUserRequest get request;
  @JsonKey(ignore: true)
  _$$UserRegisterEventCopyWith<_$UserRegisterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState();

  @override
  String toString() {
    return 'RegisterState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RegisterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
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
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState() = _$_RegisterState;
}

/// @nodoc
abstract class _$$UserFullNameErrorStateCopyWith<$Res> {
  factory _$$UserFullNameErrorStateCopyWith(_$UserFullNameErrorState value,
          $Res Function(_$UserFullNameErrorState) then) =
      __$$UserFullNameErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$UserFullNameErrorStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserFullNameErrorState>
    implements _$$UserFullNameErrorStateCopyWith<$Res> {
  __$$UserFullNameErrorStateCopyWithImpl(_$UserFullNameErrorState _value,
      $Res Function(_$UserFullNameErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$UserFullNameErrorState(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserFullNameErrorState implements UserFullNameErrorState {
  const _$UserFullNameErrorState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegisterState.userFullNameErrorState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFullNameErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFullNameErrorStateCopyWith<_$UserFullNameErrorState> get copyWith =>
      __$$UserFullNameErrorStateCopyWithImpl<_$UserFullNameErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return userFullNameErrorState(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return userFullNameErrorState?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (userFullNameErrorState != null) {
      return userFullNameErrorState(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return userFullNameErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return userFullNameErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (userFullNameErrorState != null) {
      return userFullNameErrorState(this);
    }
    return orElse();
  }
}

abstract class UserFullNameErrorState implements RegisterState {
  const factory UserFullNameErrorState({required final String errorMessage}) =
      _$UserFullNameErrorState;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$UserFullNameErrorStateCopyWith<_$UserFullNameErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserPhoneNumberErrorStateCopyWith<$Res> {
  factory _$$UserPhoneNumberErrorStateCopyWith(
          _$UserPhoneNumberErrorState value,
          $Res Function(_$UserPhoneNumberErrorState) then) =
      __$$UserPhoneNumberErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$UserPhoneNumberErrorStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserPhoneNumberErrorState>
    implements _$$UserPhoneNumberErrorStateCopyWith<$Res> {
  __$$UserPhoneNumberErrorStateCopyWithImpl(_$UserPhoneNumberErrorState _value,
      $Res Function(_$UserPhoneNumberErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$UserPhoneNumberErrorState(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserPhoneNumberErrorState implements UserPhoneNumberErrorState {
  const _$UserPhoneNumberErrorState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegisterState.userPhoneNumberErrorState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPhoneNumberErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPhoneNumberErrorStateCopyWith<_$UserPhoneNumberErrorState>
      get copyWith => __$$UserPhoneNumberErrorStateCopyWithImpl<
          _$UserPhoneNumberErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return userPhoneNumberErrorState(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return userPhoneNumberErrorState?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (userPhoneNumberErrorState != null) {
      return userPhoneNumberErrorState(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return userPhoneNumberErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return userPhoneNumberErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (userPhoneNumberErrorState != null) {
      return userPhoneNumberErrorState(this);
    }
    return orElse();
  }
}

abstract class UserPhoneNumberErrorState implements RegisterState {
  const factory UserPhoneNumberErrorState(
      {required final String errorMessage}) = _$UserPhoneNumberErrorState;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$UserPhoneNumberErrorStateCopyWith<_$UserPhoneNumberErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserBloodGroupErrorStateCopyWith<$Res> {
  factory _$$UserBloodGroupErrorStateCopyWith(_$UserBloodGroupErrorState value,
          $Res Function(_$UserBloodGroupErrorState) then) =
      __$$UserBloodGroupErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$UserBloodGroupErrorStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserBloodGroupErrorState>
    implements _$$UserBloodGroupErrorStateCopyWith<$Res> {
  __$$UserBloodGroupErrorStateCopyWithImpl(_$UserBloodGroupErrorState _value,
      $Res Function(_$UserBloodGroupErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$UserBloodGroupErrorState(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserBloodGroupErrorState implements UserBloodGroupErrorState {
  const _$UserBloodGroupErrorState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegisterState.userBloodGroupErrorState(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBloodGroupErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBloodGroupErrorStateCopyWith<_$UserBloodGroupErrorState>
      get copyWith =>
          __$$UserBloodGroupErrorStateCopyWithImpl<_$UserBloodGroupErrorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return userBloodGroupErrorState(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return userBloodGroupErrorState?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (userBloodGroupErrorState != null) {
      return userBloodGroupErrorState(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return userBloodGroupErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return userBloodGroupErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (userBloodGroupErrorState != null) {
      return userBloodGroupErrorState(this);
    }
    return orElse();
  }
}

abstract class UserBloodGroupErrorState implements RegisterState {
  const factory UserBloodGroupErrorState({required final String errorMessage}) =
      _$UserBloodGroupErrorState;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$UserBloodGroupErrorStateCopyWith<_$UserBloodGroupErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRegisterLoadingStateCopyWith<$Res> {
  factory _$$UserRegisterLoadingStateCopyWith(_$UserRegisterLoadingState value,
          $Res Function(_$UserRegisterLoadingState) then) =
      __$$UserRegisterLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserRegisterLoadingStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserRegisterLoadingState>
    implements _$$UserRegisterLoadingStateCopyWith<$Res> {
  __$$UserRegisterLoadingStateCopyWithImpl(_$UserRegisterLoadingState _value,
      $Res Function(_$UserRegisterLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserRegisterLoadingState implements UserRegisterLoadingState {
  const _$UserRegisterLoadingState();

  @override
  String toString() {
    return 'RegisterState.registerLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return registerLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return registerLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerLoading != null) {
      return registerLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return registerLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return registerLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerLoading != null) {
      return registerLoading(this);
    }
    return orElse();
  }
}

abstract class UserRegisterLoadingState implements RegisterState {
  const factory UserRegisterLoadingState() = _$UserRegisterLoadingState;
}

/// @nodoc
abstract class _$$UserRegisterErrorStateCopyWith<$Res> {
  factory _$$UserRegisterErrorStateCopyWith(_$UserRegisterErrorState value,
          $Res Function(_$UserRegisterErrorState) then) =
      __$$UserRegisterErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$UserRegisterErrorStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserRegisterErrorState>
    implements _$$UserRegisterErrorStateCopyWith<$Res> {
  __$$UserRegisterErrorStateCopyWithImpl(_$UserRegisterErrorState _value,
      $Res Function(_$UserRegisterErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$UserRegisterErrorState(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRegisterErrorState implements UserRegisterErrorState {
  const _$UserRegisterErrorState({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'RegisterState.registerError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterErrorStateCopyWith<_$UserRegisterErrorState> get copyWith =>
      __$$UserRegisterErrorStateCopyWithImpl<_$UserRegisterErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return registerError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return registerError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerError != null) {
      return registerError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return registerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return registerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerError != null) {
      return registerError(this);
    }
    return orElse();
  }
}

abstract class UserRegisterErrorState implements RegisterState {
  const factory UserRegisterErrorState({required final String errorMessage}) =
      _$UserRegisterErrorState;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$UserRegisterErrorStateCopyWith<_$UserRegisterErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRegisterSuccessStateCopyWith<$Res> {
  factory _$$UserRegisterSuccessStateCopyWith(_$UserRegisterSuccessState value,
          $Res Function(_$UserRegisterSuccessState) then) =
      __$$UserRegisterSuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserRegisterSuccessStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$UserRegisterSuccessState>
    implements _$$UserRegisterSuccessStateCopyWith<$Res> {
  __$$UserRegisterSuccessStateCopyWithImpl(_$UserRegisterSuccessState _value,
      $Res Function(_$UserRegisterSuccessState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserRegisterSuccessState implements UserRegisterSuccessState {
  const _$UserRegisterSuccessState();

  @override
  String toString() {
    return 'RegisterState.registerSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterSuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(String errorMessage) userFullNameErrorState,
    required TResult Function(String errorMessage) userPhoneNumberErrorState,
    required TResult Function(String errorMessage) userBloodGroupErrorState,
    required TResult Function() registerLoading,
    required TResult Function(String errorMessage) registerError,
    required TResult Function() registerSuccess,
  }) {
    return registerSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(String errorMessage)? userFullNameErrorState,
    TResult? Function(String errorMessage)? userPhoneNumberErrorState,
    TResult? Function(String errorMessage)? userBloodGroupErrorState,
    TResult? Function()? registerLoading,
    TResult? Function(String errorMessage)? registerError,
    TResult? Function()? registerSuccess,
  }) {
    return registerSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(String errorMessage)? userFullNameErrorState,
    TResult Function(String errorMessage)? userPhoneNumberErrorState,
    TResult Function(String errorMessage)? userBloodGroupErrorState,
    TResult Function()? registerLoading,
    TResult Function(String errorMessage)? registerError,
    TResult Function()? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerSuccess != null) {
      return registerSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegisterState value) $default, {
    required TResult Function(UserFullNameErrorState value)
        userFullNameErrorState,
    required TResult Function(UserPhoneNumberErrorState value)
        userPhoneNumberErrorState,
    required TResult Function(UserBloodGroupErrorState value)
        userBloodGroupErrorState,
    required TResult Function(UserRegisterLoadingState value) registerLoading,
    required TResult Function(UserRegisterErrorState value) registerError,
    required TResult Function(UserRegisterSuccessState value) registerSuccess,
  }) {
    return registerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegisterState value)? $default, {
    TResult? Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult? Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult? Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult? Function(UserRegisterLoadingState value)? registerLoading,
    TResult? Function(UserRegisterErrorState value)? registerError,
    TResult? Function(UserRegisterSuccessState value)? registerSuccess,
  }) {
    return registerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegisterState value)? $default, {
    TResult Function(UserFullNameErrorState value)? userFullNameErrorState,
    TResult Function(UserPhoneNumberErrorState value)?
        userPhoneNumberErrorState,
    TResult Function(UserBloodGroupErrorState value)? userBloodGroupErrorState,
    TResult Function(UserRegisterLoadingState value)? registerLoading,
    TResult Function(UserRegisterErrorState value)? registerError,
    TResult Function(UserRegisterSuccessState value)? registerSuccess,
    required TResult orElse(),
  }) {
    if (registerSuccess != null) {
      return registerSuccess(this);
    }
    return orElse();
  }
}

abstract class UserRegisterSuccessState implements RegisterState {
  const factory UserRegisterSuccessState() = _$UserRegisterSuccessState;
}
