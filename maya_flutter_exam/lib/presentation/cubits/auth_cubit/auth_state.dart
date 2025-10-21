import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial() = AuthStateInitial;
  factory AuthState.loading() = AuthStateLoading;
  factory AuthState.error([String? message]) = AuthStateError;
  factory AuthState.authenticated(String username) = AuthStateAuthenticated;
  factory AuthState.unauthenticated() = AuthStateUnauthenticated;
}
