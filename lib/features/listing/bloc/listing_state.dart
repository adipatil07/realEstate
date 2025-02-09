part of 'listing_bloc.dart';

@immutable
sealed class ListingState {}

final class ListingInitial extends ListingState {}

class ListingLoading extends ListingState {}

class ListingLoaded extends ListingState {
  final List<Property> properties;
  ListingLoaded(this.properties);
}

class ListingError extends ListingState {
  final String message;
  ListingError(this.message);
}

class ListingDetailsLoadingState extends ListingState {}

class ListingDetailsLoadedState extends ListingState {
  final Property property;
  final bool showAllAmenities;
  final bool showAllDetails;
  ListingDetailsLoadedState(this.property,
      {this.showAllAmenities = false, this.showAllDetails = false});
}

class ListingDetailsErrorState extends ListingState {
  final String message;
  ListingDetailsErrorState(this.message);
}
