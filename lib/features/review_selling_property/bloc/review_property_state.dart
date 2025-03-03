part of 'review_property_bloc.dart';

@immutable
sealed class ReviewPropertyState {}

final class ReviewPropertyInitial extends ReviewPropertyState {}

final class ReviewPropertyLoading extends ReviewPropertyState {}

final class ReviewPropertyError extends ReviewPropertyState {
  final String msg;
  ReviewPropertyError( {
    required this.msg
  });
}

final class ReviewPropertyLoaded extends ReviewPropertyState {
  final String propertyId;
  final String price;
  final String propertyType;
  final String area;
  final String location;
  final double listingScore;
  final File? imagePath;

  ReviewPropertyLoaded({
    required this.price,
    required this.propertyId,
    required this.propertyType,
    required this.area,
    required this.location,
    required this.listingScore,
    this.imagePath,
  });
}
