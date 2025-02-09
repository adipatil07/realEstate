part of 'prize_details_bloc.dart';

@immutable
sealed class PrizeDetailsEvent {}

class ToggleAmenitySelection extends PrizeDetailsEvent {
  final String amenity;

  ToggleAmenitySelection(this.amenity);
}

class PickImageEvent extends PrizeDetailsEvent {
  final ImageSource source;
  PickImageEvent(this.source);
}

class RemoveImageEvent extends PrizeDetailsEvent {
  final int index;
  RemoveImageEvent(this.index);
}