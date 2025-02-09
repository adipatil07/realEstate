part of 'review_property_bloc.dart';

@immutable
sealed class ReviewPropertyState {}

final class ReviewPropertyInitial extends ReviewPropertyState {}

final class ReviewPropertyLoading extends ReviewPropertyState {}

final class ReviewPropertyLoaded extends ReviewPropertyState {
  final String price;
  final String propertyType;
  final String area;
  final String location;
  final double listingScore;
  final File? imagePath; 

  ReviewPropertyLoaded({
    required this.price,
    required this.propertyType,
    required this.area,
    required this.location,
    required this.listingScore,
    this.imagePath,
  });
}
