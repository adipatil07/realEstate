part of 'listing_bloc.dart';

@immutable
sealed class ListingEvent {}

class FetchListings extends ListingEvent {}

class FetchListingDetailsEvent extends ListingEvent {
  // final int propertyId;
  // FetchListingDetailsEvent(this.propertyId);
}

class ToggleAmenitiesVisibilityEvent extends ListingEvent {}

class ToggleDetailsVisibilityEvent extends ListingEvent {}
