part of 'review_property_bloc.dart';

@immutable
sealed class ReviewPropertyEvent {}

class LoadReviewProperty extends ReviewPropertyEvent {
  final File? image;

  LoadReviewProperty({this.image});
}
