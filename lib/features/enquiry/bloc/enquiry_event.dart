part of 'enquiry_bloc.dart';

@immutable
sealed class EnquiryEvent {}

final class LoadEnquiries extends EnquiryEvent {}
