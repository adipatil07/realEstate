part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthPhoneNumberSubmitted extends AuthEvent {
  final String phoneNumber;
  AuthPhoneNumberSubmitted(this.phoneNumber);
}

final class AuthOtpSubmitted extends AuthEvent {
  final String otp;
  AuthOtpSubmitted(this.otp);
}

final class AuthPasswordSubmitted extends AuthEvent {
  final String password;
  AuthPasswordSubmitted(this.password);
}
