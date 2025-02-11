import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthBloc() : super(AuthInitial()) {
    on<SendOtpEvent>(_onSendOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<StoreUserDataEvent>(_onStoreUserData);
  }

  // Send OTP
  Future<void> _onSendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(OtpVerifiedState());
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(AuthError(e.message ?? "Verification Failed"));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(OtpSentState(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Verify OTP
  Future<void> _onVerifyOtp(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId,
        smsCode: event.otp,
      );
      await _auth.signInWithCredential(credential);
      emit(OtpVerifiedState());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Store User Data in Firestore
  Future<void> _onStoreUserData(
      StoreUserDataEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      String uid = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(uid).set(event.userData);
      emit(UserDataStored());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
