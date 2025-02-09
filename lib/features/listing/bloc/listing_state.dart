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
