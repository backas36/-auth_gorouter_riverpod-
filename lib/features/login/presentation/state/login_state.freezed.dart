// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 bool get isLoading; bool get isLoginSuccess; String? get error; Map<String, dynamic> get loginForm;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoginSuccess, isLoginSuccess) || other.isLoginSuccess == isLoginSuccess)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.loginForm, loginForm));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoginSuccess,error,const DeepCollectionEquality().hash(loginForm));

@override
String toString() {
  return 'LoginState(isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, error: $error, loginForm: $loginForm)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isLoginSuccess, String? error, Map<String, dynamic> loginForm
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isLoginSuccess = null,Object? error = freezed,Object? loginForm = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoginSuccess: null == isLoginSuccess ? _self.isLoginSuccess : isLoginSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loginForm: null == loginForm ? _self.loginForm : loginForm // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc


class _LoginState implements LoginState {
   _LoginState({this.isLoading = false, this.isLoginSuccess = false, this.error, final  Map<String, dynamic> loginForm = const {}}): _loginForm = loginForm;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoginSuccess;
@override final  String? error;
 final  Map<String, dynamic> _loginForm;
@override@JsonKey() Map<String, dynamic> get loginForm {
  if (_loginForm is EqualUnmodifiableMapView) return _loginForm;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_loginForm);
}


/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoginSuccess, isLoginSuccess) || other.isLoginSuccess == isLoginSuccess)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._loginForm, _loginForm));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoginSuccess,error,const DeepCollectionEquality().hash(_loginForm));

@override
String toString() {
  return 'LoginState(isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, error: $error, loginForm: $loginForm)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isLoginSuccess, String? error, Map<String, dynamic> loginForm
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isLoginSuccess = null,Object? error = freezed,Object? loginForm = null,}) {
  return _then(_LoginState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoginSuccess: null == isLoginSuccess ? _self.isLoginSuccess : isLoginSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loginForm: null == loginForm ? _self._loginForm : loginForm // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
