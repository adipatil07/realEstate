part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthPhoneNumberEntered extends AuthState {}

final class AuthOtpSent extends AuthState {}

final class AuthOtpVerified extends AuthState {}

final class AuthPasswordSetup extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
