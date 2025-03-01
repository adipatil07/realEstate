part of 'property_submission_bloc.dart';

abstract class PropertySubmissionState {}

class PropertySubmissionInitial extends PropertySubmissionState {}

class PropertyDataUpdated extends PropertySubmissionState {
  final CreatePropertyModel property;
  PropertyDataUpdated(this.property);
}

class PropertySubmitting extends PropertySubmissionState {}

class PropertySubmittedSuccess extends PropertySubmissionState {}

class PropertySubmittedFailure extends PropertySubmissionState {
  final String error;
  PropertySubmittedFailure(this.error);
}
