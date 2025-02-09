part of 'listing_bloc.dart';

@immutable
sealed class ListingEvent {}


class FetchListings extends ListingEvent {}