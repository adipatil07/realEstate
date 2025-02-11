import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Send OTP
class SendOtpEvent extends AuthEvent {
  final String phoneNumber;
  SendOtpEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

// Verify OTP
class VerifyOtpEvent extends AuthEvent {
  final String verificationId;
  final String otp;
  VerifyOtpEvent(this.verificationId, this.otp);

  @override
  List<Object?> get props => [verificationId, otp];
}

// Store User Data
class StoreUserDataEvent extends AuthEvent {
  final Map<String, dynamic> userData;
  StoreUserDataEvent(this.userData);

  @override
  List<Object?> get props => [userData];
}
