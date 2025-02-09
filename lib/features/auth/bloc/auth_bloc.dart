import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthPhoneNumberSubmitted>((event, emit) {
      // Simulate sending OTP
      emit(AuthOtpSent());
    });

    on<AuthOtpSubmitted>((event, emit) {
      // Simulate OTP verification
      // if (event.otp == "123456") {
      //   emit(AuthOtpVerified());
      // } else {
      //   emit(AuthFailure("Invalid OTP"));
      // }
      emit(AuthOtpVerified());
    });

    on<AuthPasswordSubmitted>((event, emit) {
      // Simulate password setup
      emit(AuthSuccess());
    });
  }
}
