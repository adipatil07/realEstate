import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class OtpSentState extends AuthState {
  final String verificationId;
  OtpSentState(this.verificationId);

  @override
  List<Object?> get props => [verificationId];
}

class OtpVerifiedState extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserDataStored extends AuthState {}
