part of 'enquiry_bloc.dart';

@immutable
sealed class EnquiryState {}

final class EnquiryInitial extends EnquiryState {
  EnquiryInitial();
}

final class EnquiryLoading extends EnquiryState {
  EnquiryLoading();
}

final class EnquiryLoaded extends EnquiryState {
  final List<Enquiry> enquiries;

  EnquiryLoaded(this.enquiries);
}

final class EnquiryError extends EnquiryState {
  final String message;

  EnquiryError(this.message);
}